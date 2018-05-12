require 'json'
get '/api/memos' do
  # TODO この424をcookieなどで保存した値へと変更する
  user = User.find(424)
  memos = user.memo.order('id desc')
  data = { username: user.username, memos: memos }
  data[:memos] = data[:memos].select { |m| m.memo_status.include? params[:like] } if params[:like]
  data.to_json
end
