if ! empty(neobundle#get("tagbar"))
    " Width (default 40)
    let g:tagbar_width = 40
    " Map for toggle
    nn <silent> <leader>t :TagbarToggle<CR>
endif
