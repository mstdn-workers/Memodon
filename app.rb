require 'sass/plugin/rack'

# sassをコンパイルしてcssをよしなにしてくれるようにする
use Sass::Plugin::Rack
# slimでlayoutを使う設定
set :slim, layout: true

get '/' do
  slim :index
end

get '/memo' do
  user = User.find(424)
  @memos = user.memo.order('status_id desc')

  @name = user.username
  @name = user.display + '@' + @name unless user.display.empty?
  slim :memo
end
