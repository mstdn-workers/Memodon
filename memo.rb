require './lib/app_register'
require './lib/memo_observer'
# 定期実行の開始
AppRegister.instance.register_app
observer = MemoObserver.new

Thread.new do
  loop do
    observer.behavior
    sleep(20)
  end
end
