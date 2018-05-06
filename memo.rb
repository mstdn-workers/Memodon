require './lib/app_register'
require './lib/memo_observer'
# 定期実行の開始
AppRegister.new.register_app

observer = MemoObserver.new
observer.behavior
