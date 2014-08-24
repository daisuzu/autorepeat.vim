" autorepeat.vim - Repeat the normal mode command automatically.
" Version: 0.0.1
" Author: daisuzu <daisuzu@gmail.com>
" License: MIT license

if exists('g:loaded_autorepeat')
  finish
endif
let g:loaded_autorepeat = 1

let s:save_cpo = &cpo
set cpo&vim


" 500ms
let g:autorepeat_timeout = get(g:, 'autorepeat_timeout', 0.5)
" 50ms
let g:autorepeat_interval = get(g:, 'autorepeat_interval', '50m')

noremap <silent> <Plug>(autorepeat) :<C-u>call autorepeat#do()<CR>


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
