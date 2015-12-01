"=============================================================================
" FILE: cppFormat.vim
" AUTHOR:  Luis Ayuso
" License: WTFPL license  {{{
"
" }}}
"=============================================================================


" vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim

" automatic plugin load
call cppFormat#Enable()

" vim plugin boilerplate
let &cpo = s:save_cpo 
unlet s:save_cpo
