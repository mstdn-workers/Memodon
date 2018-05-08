require 'sass/plugin/rack'

# sassをコンパイルしてcssをよしなにしてくれるようにする
use Sass::Plugin::Rack
# slimでlayoutを使う設定
set :slim, layout: true

get '/' do
  slim :index
end

get '/memo' do
  @memos = User.find(424).memo.order('status_id desc')
  slim :memo
end
