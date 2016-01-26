#Windows用初期設定スクリプト
#Git Bashが必要
#事前に管理者権限でパワーシェルを開き，"?Set-ExecutionPolicy RemoteSigned"を実行
#環境変数HOMEも設定が必要

if($HOME -eq $null){exit}
git clone git://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
.\set_setting.ps1
