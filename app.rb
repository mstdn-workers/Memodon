require 'sass/plugin/rack'
require "sinatra/reloader" if development?
require 'uri'
require 'securerandom'

# sassをコンパイルしてcssをよしなにしてくれるようにする
use Sass::Plugin::Rack
# slimでlayoutを使う設定
set :slim, layout: true
# sessionsを許可する
use Rack::Session::Cookie,
  expire_after: 2_592_000,
  secret: SecureRandom.alphanumeric(64)

require './helpers'

require './route/api'

get '/' do
  slim :index
end

get '/memo' do
  redirect '/login' unless login?
  slim :memo
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/login' do
  client = MstdnIvory::Client.new('https://mstdn-workers.com')
  id, secret = AppRegister.instance.client_info
  uri = client.create_authorization_url(id, secret, 'read', AppRegister.instance.redirect_uri)
  redirect uri
end

get '/callback/oauth' do
  code = params['code']
  client = MstdnIvory::Client.new('https://mstdn-workers.com')
  id, secret = AppRegister.instance.client_info
  client.get_access_token(id, secret, code, AppRegister.instance.redirect_uri)
  id = client.get('/api/v1/accounts/verify_credentials').id
  session[:user_id] = id.to_i
  redirect '/memo'
end
