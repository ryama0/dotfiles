let g:syntastic_check_on_open=1
"":Errorsで詳細を表示
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
""C++
let g:syntastic_c_check_header=1
let g:syntastic_cpp_check_header=1

if executable("clang++")
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = '-std=c++11'
elseif executable("g++")
  let g:syntastic_cpp_compiler = 'g++'
  let g:syntastic_cpp_compiler_options = '--std=c++11'
endif
""C#
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
