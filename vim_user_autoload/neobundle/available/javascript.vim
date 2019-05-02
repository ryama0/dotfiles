if executable('npm')
  NeoBundle 'ternjs/tern_for_vim' ,{'build': {'unix': 'npm install', 'mac': 'npm install'}}
  NeoBundle 'jelera/vim-javascript-syntax'
  au FileType javascript call JavaScriptFold()
endif

