" ===========================================================================
" FILE        : ftplugin/python.vim
" DESCRIPTION : Specific Vim configuration for Python source code.
" AUTHOR      : @diacus (diacus.magnuz@gmail.com)
" LAST CHANGE : Sat Oct 31 20:00:00 CST 2026
" CREATION    : mié feb 14 23:55:19 CST 2018
" ===========================================================================

call development#python_setup()

" Python sources use 4 spaces of indentation, see |development-setup|
let b:code_indent = 4

" Multi line docstrings
inoremap <buffer> '<CR> '''<CR>'''<Esc>kA
inoremap <buffer> "<CR> """<CR>"""<Esc>kA

command! -nargs=0 BreakPoint call development#python_breakpoint_add()
command! -nargs=0 UnbreakPoint call development#python_breakpoint_del()