filetype plugin on
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
""""""""""""""""""""""                                                                                                                 
"Quickly Run
"""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc

set cursorline
set tabstop=4
set autoindent
set expandtab
set nu
function PythonHeader()
    call setline(1, "#!/usr/bin/python")
    call setline(2, "# -*- coding:utf-8 -*-")
    normal 0
endfunction
autocmd BufNewFile *.py call PythonHeader() 
