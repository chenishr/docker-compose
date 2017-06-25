filetype plugin indent on    " required

autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  

"set showcmd         " 输入的命令显示出来，看的清楚些  
"set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠  

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助


if version >= 603
    set helplang=cn
	set encoding=utf-8
endif
" 设置配色方案

set background=light

set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.sh,*.php,*.py exec ":call SetTitle()" 

"定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 

        call setline(1,"\#########################################################################") 
        call append(line("."),   "\# File Name:\t".expand("%")) 
        call append(line(".")+1, "\# Author:\t\tchenishr") 
        call append(line(".")+2, "\# mail:\t\t\tchenishr@gmail.com") 
        call append(line(".")+3, "\# Created Time:\t".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 

	endif

    if &filetype == 'php' 
        call setline(1, "<?php ") 

        call append(line("."),	"\/*************************************************************************") 
        call append(line(".")+1, " * File Name:\t\t".expand("%")) 
        call append(line(".")+2, " * Author:\t\t\tchenishr") 
        call append(line(".")+3, " * Mail: \t\t\tchenishr@gmail.com ") 
        call append(line(".")+4, " * Created Time:\t".strftime("%c")) 
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "")

    endif

    if &filetype == 'html' 
        call setline(1,"\#########################################################################") 
        call append(line("."),   "\# File Name:\t".expand("%")) 
        call append(line(".")+1, "\# Author:\t\tchenishr") 
        call append(line(".")+2, "\# mail:\t\t\tchenishr@gmail.com") 
        call append(line(".")+3, "\# Created Time:\t".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/usr/bin/env python") 
        call append(line(".")+6, "") 

	endif

    if &filetype == 'py' 
        call setline(1,"\#########################################################################") 
        call append(line("."),   "\# File Name:\t".expand("%")) 
        call append(line(".")+1, "\# Author:\t\tchenishr") 
        call append(line(".")+2, "\# mail:\t\t\tchenishr@gmail.com") 
        call append(line(".")+3, "\# Created Time:\t".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/usr/bin/env python") 
        call append(line(".")+6, "") 

	endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 


"对齐赋值运算符
" source /home/chenishr/.vim/alignAssignments.vim

"自动补全
"source /home/chenishr/.vim/smartComplate.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread

"共享剪贴板  
set clipboard+=unnamed 

"从不备份  
set nobackup

"自动保存
set autowrite

set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\


" 设置在状态行显示的信息


"set foldcolumn=0
"set foldmethod=indent 
"set foldlevel=3 
"set foldenable              " 开始折叠

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" 语法高亮
set syntax=on

" 去掉输入错误的提示声音
set noeb

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 自动缩进
set autoindent
set cindent

" Tab键的宽度
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 在行和段开始处使用制表符
set smarttab

" 显示行号
set number

" 历史记录数
set history=1000

"禁止生成临时文件
set nobackup
set noswapfile

"搜索逐字符高亮
set hlsearch
set incsearch

"行内替换
"set gdefault

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3


" auto complate

" ctags
set tags=tags
set autochdir

" taglist
" filetype plugin indent on　　　　　　　　 "打开文件类型检测功能 
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'  "设定系统中ctags程序的位置 
" let Tlist_Show_One_File = 1		"不同时显示多个文件的tag，只显示当前文件的 
" let Tlist_Exit_OnlyWindow = 1	"如果taglist窗口是最后一个窗口，则退出vim 
" map :TlistToggle				"按F9等同于在命令行模式输入:TlistToggle

" xdebug
let g:debuggerPort = 9100 "（该端口必须与xdebug.remote_port相同）
let g:debuggerMaxDepth = 5
