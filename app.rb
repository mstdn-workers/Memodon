require 'sass/plugin/rack'
require "sinatra/reloader" if development?
require 'uri'

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

get '/login' do
  client = MstdnIvory::Client.new('https://mstdn-workers.com')
  id, secret = AppRegister.instance.client_info
  uri = client.create_authorization_url(id, secret, 'read', AppRegister.instance.redirect_uri)
  # &が一部のみ変換されるため修正する
  uri.gsub!('%0A', '&')
  redirect uri
end

get '/callback/oauth' do
 p params
 params
end
