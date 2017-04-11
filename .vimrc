""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Display
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " ....................  
"winpos 5 5          " ......  
"set lines=40 columns=155    " ......  
"set nu              " ....  
set go=             " ......  
"color asmanian2     " ......  
""set guifont=Courier_New:h10:cANSI   " ....  
"set guifont=Courier_10_Pitch\ h17   " ....  
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10  " ....  
"syntax on           " ....  
autocmd InsertLeave * se nocul  " ........  
autocmd InsertEnter * se cul    " ........  
"set ruler           " ....  
"set showcmd         " ...............  
"set cmdheight=1     " .................1  
"set whichwrap+=<,>,h,l   " ..backspace.........(...)  
"set scrolloff=3     " .....buffer.........3...  
set novisualbell    " ....(...)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "........  
set laststatus=1    " .......(1),.......(2)  
set foldenable      " ....  
set foldmethod=manual   " ....  
"set background=dark "...... 
set nocompatible  ".......vi...............bug...  
" ......
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" ......
"colorscheme murphy
".. 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 
 

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""New file tile"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"New file c,.h,.sh,.java.......... 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""....SetTitle........ 
func SetTitle() 
    "........sh.. 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: ma6174") 
        call append(line(".")+2, "\# mail: ma6174@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: ma6174") 
        call append(line(".")+2, "    > Mail: ma6174@163.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "...............
    autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"....
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" ....+.. ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" ..... Ctrl+c ..
vmap <C-c> "+y
"...  
nnoremap <F2> :g/^\s*$/d<CR> 
"....  
nnoremap <C-F2> :vert diffsplit 
"....  
map <M-F2> :tabnew<CR>  
"........  
map <F3> :tabnew .<CR>  
"........  
map <C-F3> \be  
"C.C++ .F5....
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++...
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""....
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .............
set autoread
" quickfix..
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
".... 
set completeopt=preview,menu 
"....  
filetype plugin on
".....  
set clipboard+=unnamed 
"....  
set nobackup
"make ..
:set makeprg=g++\ -Wall\ \ %
"....
set autowrite
"set ruler                   " .......
set cursorline              " .......
set magic                   " ....
set guioptions-=T           " .....
set guioptions-=m           " .....
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" ...........
set foldcolumn=0
set foldmethod=indent 
set foldlevel=3 
set foldenable              " ....
" ....vi........vim...
set nocompatible
" ....
"set syntax=on
" ...........
set noeb
" ...................
set confirm
" ....
set autoindent
set cindent
" Tab....
set tabstop=4
" .....4
set softtabstop=4
set shiftwidth=4
" ..........
set noexpandtab
" ............
set smarttab
" ....
set number
" .....
set history=1000
"........
set nobackup
set noswapfile
".......
set ignorecase
".......
set hlsearch
set incsearch
"....
set gdefault
"....
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"....
set langmenu=zh_CN.UTF-8
set helplang=cn
" .....................
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" .......
set laststatus=2
" .................1....2
set cmdheight=2
" ......
filetype on
" ........
filetype plugin on
" ...............
filetype indent on
" ......
set viminfo+=!
" ................
set iskeyword+=_,$,@,%,#,-
" ...........
set linespace=0
" ...............
set wildmenu
" .....backspace.....indent, eol, start.
set backspace=2
" ..backspace.........
set whichwrap+=<,>,h,l
" ...buffer............office............
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" ....: commands.................
set report=0
" .................
set fillchars=vert:\ ,stl:\ ,stlnc:\
" .........
set showmatch
" ...................
set matchtime=1
" .....buffer.........3...
set scrolloff=3
" .C........
set smartindent
" ......txt.....txt.vim...
au BufRead,BufNewFile *  setfiletype txt
"....
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"........, ............
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags...  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let Tlist_Sort_Type = "name"    " ......  
"let Tlist_Use_Right_Window = 1  " .......  
"let Tlist_Compart_Format = 1    " ....  
"let Tlist_Exist_OnlyWindow = 1  " ......buffer.kill...kill.buffer  
"let Tlist_File_Fold_Auto_Close = 0  " .........tags  
"let Tlist_Enable_Fold_Column = 0    " .......  
"autocmd FileType java set tags+=D:\tools\java\tags  
""autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
""let Tlist_Show_One_File=1            "..........tag.........
""..tags  
"set tags=tags  
""set autochdir 

"Tlist
let Tlist_Use_Right_Window=1        "Place the taglist window on the right side
let Tlist_Show_One_File=1           "Show tags for the current buffer only 
let Tlist_File_Fold_Auto_Close=1    "Tlist_File_Fold_Auto_Close=1   
let Tlist_Exit_OnlyWindow=1         "Close Vim if the taglist is the only window. 
let Tlist_Process_File_Always=0     "Process files even when the taglist window is closed. 
let Tlist_Inc_Winwidth=0            "Increase the Vim window width to accommodate the taglist window. 
let Tlist_WinWidth=40             
let Tlist_Close_On_Select=0             
let Tlist_GainFocus_On_ToggleOpen=1
map <silent><F5> :TlistToggle<cr>

"set the winManagement
"use WinManager to let TagList and netrw together
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"miniBufExp
let g:miniBufExplMapWindowNavVim = 1 "this difination will let to CTRL+H error
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"....
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"....Taglist 
let Tlist_Auto_Open=1 
"""""""""""""""""""""""""""""" 
" Tag list (ctags) 
"""""""""""""""""""""""""""""""" 
let Tlist_Ctags_Cmd = '/usr/bin/ctags' 
let Tlist_Show_One_File = 1 "..........tag......... 
let Tlist_Exit_OnlyWindow = 1 "..taglist.............vim 
let Tlist_Use_Right_Window = 1 "........taglist..
" minibufexpl.......
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-colors-solarized settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"option name               default     optional
"------------------------------------------------
"g:solarized_termcolors=   16      |   256
"g:solarized_termtrans =   0       |   1
"g:solarized_degrade   =   0       |   1
"g:solarized_bold      =   1       |   0
"g:solarized_underline =   1       |   0
"g:solarized_italic    =   1       |   0
"g:solarized_contrast  =   "normal"|   "high" or "low"
"g:solarized_visibility=   "normal"|   "high" or "low"
"------------------------------------------------


g:solarized_termcolors=   16      
g:solarized_termtrans =   0       
g:solarized_degrade   =   0       
g:solarized_bold      =   1       
g:solarized_underline =   1       
g:solarized_italic    =   1       
g:solarized_contrast  =   "normal"
g:solarized_visibility=   "normal"

"syntax enable
set background=light
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " add by zhangcl
    elseif filereadable("/vobs/drv_project/cscope.out")
        cs add /vobs/drv_project/cscope.out  
    elseif filereadable("/vobs/firmware/cscope.out")
        cs add /vobs/firmware/cscope.out  
    elseif filereadable("/vobs/asm_tce5_cr/cscope.out")
        cs add /vobs/asm_tce5_cr/cscope.out  
    elseif filereadable("/vobs/drv_tce5_cr/cscope/cscope.out")
        cs add /vobs/drv_tce5_cr/cscope/cscope.out  
    " end added
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
    "
    "
    "
endif





