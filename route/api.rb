require 'json'
get '/api/memos' do
  user = User.find(session[:user_id])
  memos = user.memo.order('id desc')
  data = { username: user.username, memos: memos }
  data[:memos] = data[:memos].select { |m| m.memo_status.include? params[:like] } if params[:like]
  data.to_json
end
