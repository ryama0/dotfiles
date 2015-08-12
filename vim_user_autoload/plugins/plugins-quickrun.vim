let g:quickrun_config = get(g:, 'quickrun_config', {})
" vimproc を使って非同期に実行し，結果を quickfix に出力する
let g:quickrun_config['_'] = {
    \ "hook/close_quickfix/enable_hook_loaded" : 1,
    \ "hook/close_quickfix/enable_success" : 1,
    \ "hook/close_buffer/enable_failure" : 1,
    \ "hook/close_buffer/enable_empty_data" : 1,
    \ "outputter" : "multi:buffer:quickfix",
    \ "outputter/buffer/split" : ":botright 8sp",
    \ 'runner' : 'vimproc',
    \ 'runner/vimproc/updatetime' : 40,
    \ }

"C++
if executable("clang++")
  let g:quickrun_config['cpp/clang++11'] = {
      \ 'command' : 'clang++',
      \ 'cmdopt': '--std=c++11 --stdlib=libc++',
      \ 'exec' : '%c %o -o %s:p:r %s'
    \ }
  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++11'}
elseif executable("g++")
  let g:quickrun_config['cpp11'] = {
      \ 'command' : 'g++',
      \ 'cmdopt' : '--std=c++11',
      \ 'exec' : '%c %o -o %s:p:r %s'
      \ }
  let g:quickrun_config['cpp'] = {'type' : 'cpp11'}
endif

"Tex
let g:quickrun_config['latex'] = {
    \ 'command' : 'latexmk',
    \ 'cmdopt' : '-pdfdvi',
    \ 'outputter' : 'error',
    \ 'outputter/error/error' : 'quickfix',
    \ 'exec' : ['%c %o %s','%c -c','open %s:r.pdf']
    \ }
