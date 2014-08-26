" autorepeat.vim - Repeat the normal mode command automatically.
" Version: 0.0.1-1
" Author: daisuzu <daisuzu@gmail.com>
" License: MIT license

let s:save_cpo = &cpo
set cpo&vim


function! autorepeat#do()
    " Replace '<Space>' with '1<Space>' for :normal
    let seq = substitute(s:getchars(), ' ', '1 ', 'g')

    while 1
        silent! execute 'normal ' . seq
        if getchar(1)
            let break = s:getchars()
            silent! execute 'normal ' . break
            break
        endif
        redraw!
        execute 'sleep ' . g:autorepeat_interval
    endwhile
endfunction

function! s:getchar()
    let c = getchar()
    return type(c) == type(0) ? nr2char(c) : c
endfunction

function! s:getchars()
    " get the first key
    let seq = s:getchar()

    let start = reltime()
    while 1
        let elapsed = str2float(reltimestr(reltime(start)))
        if getchar(1)
            let seq .= s:getchar()
            let start = reltime()
        endif
        if elapsed > g:autorepeat_timeout
            return seq
        endif
        sleep 10m
    endwhile
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:
