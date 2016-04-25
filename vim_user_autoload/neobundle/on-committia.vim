" git用プラグイン
NeoBundle 'rhysd/committia.vim'

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " Additional settings
  setlocal spell
endfunction
