" syntax
NeoBundle 'rust-lang/rust.vim'

if filereadable( $HOME . "/.cargo/bin/racer")
  " autocomplete
  NeoBundle 'racer-rust/vim-racer'
  set hidden
  let g:racer_cmd = $HOME . "/.cargo/bin/racer"
  au FileType rust nmap gd <Plug>(rust-def)
  au FileType rust nmap gs <Plug>(rust-def-split)
  au FileType rust nmap gx <Plug>(rust-def-vertical)
  au FileType rust nmap <leader>gd <Plug>(rust-doc)
endif
