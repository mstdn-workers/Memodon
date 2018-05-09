require 'sass/plugin/rack'

# sassをコンパイルしてcssをよしなにしてくれるようにする
use Sass::Plugin::Rack
# slimでlayoutを使う設定
set :slim, layout: true

require './route/api'

get '/' do
  slim :index
end

get '/memo' do
  slim :memo
end
