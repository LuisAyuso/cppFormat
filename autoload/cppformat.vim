"=============================================================================
" FILE: cppFormat.vim
" AUTHOR:  Luis Ayuso
" License: WTFPL license  {{{
"
" }}}
"=============================================================================

if exists("g:cppformat_load")
    finish
endif
let g:cppformat_load = 1


" vim plugin boilerplate
let s:save_cpo = &cpo
set cpo&vim


" SECTION: config
"=============================================================================
if !exists("g:cppformat_command")
    let g:cppformat_command = "clang-format"
endif


" SECTION: General functions
"=============================================================================
function! cppformat#version()
    return 0.1
endfunction



" this function works with a file, not a vim buffer, for this reason, 
" we sillently overwrite the file and reload the buffer
function! cppformat#formatfile()


    " format file
    let l:res = system(g:cppformat_command . " -i " . bufname("%"))
    
    "reload externaly altered file
    edit

    " for some reason the syntax highlighting is lost after reload
    set syntax=cpp

endfunction





function! cppformat#Enable()

    echohl  "cpp format plugin"
    augroup cppformatStart
      autocmd!
      autocmd  BufWritePost *.cpp call cppformat#formatfile()
      autocmd  BufWritePost *.cxx call cppformat#formatfile()
      autocmd  BufWritePost *.cc call cppformat#formatfile()
    augroup END
endfunction



" vim plugin boilerplate
let &cpo = s:save_cpo 
unlet s:save_cpo
