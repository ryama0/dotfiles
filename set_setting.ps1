.\UTF8toSJIS.ps1 -in .gvimrc -out ../_gvimrc
.\UTF8toSJIS.ps1 -in .vimperatorrc -out ../_vimperatorrc
.\UTF8toSJIS.ps1 -in .vimrc -out ../_vimrc

mkdir $HOME\vimfiles
mkdir $HOME\vimfiles\user_autoload\init
Get-ChildItem  vim_user_autoload\init | ForEach-Object {Invoke-Expression ("./UTF8toSJIS.ps1 -in vim_user_autoload/init/{0} -out $HOME/vimfiles/user_autoload/init/{1}.vim" -f ${_}.name ,${_}.BaseName)}
mkdir $HOME\vimfiles\user_autoload\plugins
Get-ChildItem  vim_user_autoload\plugins | ForEach-Object {Invoke-Expression ("./UTF8toSJIS.ps1 -in vim_user_autoload/plugins/{0} -out $HOME/vimfiles/user_autoload/plugins/{1}.vim" -f ${_}.name ,${_}.BaseName)}
Copy-Item .latexmkrc ${HOME}/.latexmkrc
