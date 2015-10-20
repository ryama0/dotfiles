if exists("g:enable_clang_complete")
  let g:clang_complete_auto = 0
  let g:clang_periodic_quickfix = 1
  let g:clang_complete_copen = 1
  let g:clang_use_library = 1
  " this need to be updated on llvm update
  let g:clang_library_path = '/usr/lib/llvm-3.6/lib'
  " specify compiler options
  let g:clang_user_options = '-std=gnu++14 -stdlib=c++'
endif
