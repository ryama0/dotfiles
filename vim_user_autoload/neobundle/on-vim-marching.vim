"vim-marching
if executable('clang')
  NeoBundle "osyo-manga/vim-marching"
  let g:enable_marching=1
endif

if exists("g:enable_marching")
  function! s:meet_neocomplete_requirements()
    return has('lua') && (v:version > 703 || (v:version == 703 && has('patch885')))
  endfunction

  "C or C++
  "marching.vim
  if executable('clang')
      let g:marching#clang_command = "clang"
      let g:marching#clang_command#options = {
        \ "cpp" : "-std=c++11"
        \ }

      let g:marching_include_paths = [
        \ "/usr/local/include",
        \ 'include'
        \ ]
      let g:marching_wait_time = 2.0
      if s:meet_neocomplete_requirements()
        let g:marching_enable_neocomplete = 1
        if !exists('g:neocomplete#force_omni_input_patterns')
          let g:neocomplete#force_omni_input_patterns = {}
        endif
        let g:neocomplete#force_omni_input_patterns.c =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
        let g:neocomplete#force_omni_input_patterns.cpp =
          \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
        let g:neocomplete#force_omni_input_patterns.objc =
          \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
        let g:neocomplete#force_omni_input_patterns.objcpp =
          \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
      endif
  endif
endif
