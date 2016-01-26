function utf8_to_sjis ($in, $out){
  Get-Content -Encoding UTF8 $in | Set-Content $out
}

utf8_to_sjis .gvimrc ../_gvimrc
utf8_to_sjis .vimperatorrc ../_vimperatorrc
utf8_to_sjis .vimrc ../_vimrc

mkdir $HOME\vimfiles
mkdir $HOME\vimfiles\user_autoload\init
Get-ChildItem  vim_user_autoload\init | ForEach-Object {Invoke-Expression ("utf8_to_sjis vim_user_autoload/init/{0} $HOME/vimfiles/user_autoload/init/{1}.vim" -f ${_}.name ,${_}.BaseName)}
mkdir $HOME\vimfiles\user_autoload\plugins
Get-ChildItem  vim_user_autoload\plugins | ForEach-Object {Invoke-Expression ("utf8_to_sjis vim_user_autoload/plugins/{0} $HOME/vimfiles/user_autoload/plugins/{1}.vim" -f ${_}.name ,${_}.BaseName)}
Copy-Item .latexmkrc ${HOME}/.latexmkrc
