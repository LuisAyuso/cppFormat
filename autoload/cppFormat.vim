"=============================================================================
" FILE: cppFormat.vim
" AUTHOR:  Luis Ayuso
" License: WTFPL license  {{{
"
" }}}
"=============================================================================

if exists("g:cppFormat_load")
    finish
endif
let g:cppFormat_load = 1


" vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim


" SECTION: config
"=============================================================================
if !exists("g:cppFormat_command")
    let g:cppFormat_command = "clang-format"
endif


" SECTION: General functions
"=============================================================================
function! cppFormat#version()
    return 0.1
endfunction



" this function works with a file, not a vim buffer, for this reason, 
" we sillently overwrite the file and reload the buffer
function! cppFormat#formatfile()


    " format file
    let l:res = system(g:cppFormat_command . " -i " . bufname("%"))
    
    "reload externaly altered file
    edit

    " for some reason the syntax highlighting is lost after reload
    set syntax=cpp

endfunction





function! cppFormat#Enable()

    echohl  "cpp format plugin"
    augroup cppFormatStart
      autocmd!
      autocmd  BufWritePost *.cpp call cppFormat#formatfile()
      autocmd  BufWritePost *.cxx call cppFormat#formatfile()
      autocmd  BufWritePost *.cc call cppFormat#formatfile()
    augroup END
endfunction



" vim plugin boilerplate
let &cpo = s:save_cpo 
unlet s:save_cpo
