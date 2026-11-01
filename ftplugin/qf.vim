" ===========================================================================
" FILE        : ftplugin/qf.vim
" DESCRIPTION : Specific Vim configuration for the quickfix window.
" AUTHOR      : @diacus (diacus.magnuz@gmail.com)
" LAST CHANGE : Sat Oct 31 21:30:00 CST 2026
" CREATION    : Sun Dec 13 13:01:53 CST 2020
" ===========================================================================
" Jump to the file and line of the unittest failure under the cursor,
" see |development-quickfix|
nnoremap <buffer> <silent> <F8> :call development#qf_jump_from_python_test()<CR>