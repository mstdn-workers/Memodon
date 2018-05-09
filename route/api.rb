require 'json'
get '/api/memos/:id' do
  user = User.find(params[:id])
  memos = user.memo.order('status_id desc')
  data = { username: user.username, memos: memos }
  data[:memos] = data[:memos].select { |m| m.memo_status.include? params[:like] } if params[:like] 
  data.to_json
end
