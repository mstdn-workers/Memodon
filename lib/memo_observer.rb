require 'mstdn_ivory'

# メモをデータベースにinsertするクラス
# behaviorメソッドで自動的に(未登録の)メモ(と未登録のアカウント)をinsertする
class MemoObserver
  def initialize
    first = Memo.order('id desc').first
    @since_id = first ? first.id + 1 : 1
    @max_id = nil
    @client = MstdnIvory::Client.new('https://mstdn-workers.com')
  end

  def behavior
    timeline = @client.get('/api/v1/timelines/tag/メモ', { local: 'true', since_id: @since_id,  max_id: @max_id, limit: 40 })
    insert_database(timeline)

    # 過去のtootをクロールするための処理
    if timeline.length >= 40
      @max_id = timeline[-1].id
      sleep(1.5)
      behavior
    else
      @max_id = nil
      first = Memo.order('id desc').first
      @since_id = first ? first.id + 1 : 1
    end
  end

  def insert_database(timeline)
    timeline.each do |status|
      insert_account(status.account)
      insert_memo(status)
    end
  end

  def insert_account(account)
    User.find_or_create_by(id: account['id']) do |u|
      u.username = account['username']
      u.display = account['display_name']
    end
  end

  def insert_memo(status)
    # この前にかならずユーザーを保存しているため存在しないことは考えなくて良い
    user = User.find(status.account['id'])
    content = status.content
    content = status.spoiler_text + '</br>' + content unless status.spoiler_text.empty?
    user.memo.create do |m|
      m.id = status.id.to_i
      m.memo_status = content
    end
  end
end
