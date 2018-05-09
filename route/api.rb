require 'json'
get '/api/memos/:id' do
  user = User.find(params[:id])
  memos = user.memo.order('status_id desc')
  { username: user.username, memos: memos }.to_json
end
