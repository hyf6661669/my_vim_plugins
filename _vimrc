"关闭vi兼容模式
set nocompatible

"设置历史记录步数
set history=1000

"设置主题
colorscheme desert

"检测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on

"文件在外部被修改时，自动更新该文件
set autoread

"激活鼠标的使用
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"保存全局变量
set viminfo+=!

"带有如下符号的前后文本被认为是一个单词
set iskeyword+=_,$,@

"通过使用:commands命令，告诉我们文件的哪一行被修改过
set report=0

"被分割的窗口之间显示空白，方便阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

"set symbol for 'tab' and 'trail' in list mode
set listchars=tab:>-,trail:#

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"开启语法高亮
syntax enable
" 设置字体
" gui_gtk2 for Linux
" gui_win32 for Windows
" ====================================
" Some common fonts in windows
" ====================================
" guifont=Courier_New:h10:cANSI:qDRAFT
" guifont=DejaVu_Sans_Mono:h10:cANSI:qDRAFT
" guifont=Source_Code_Pro_Medium:h10:W500:cANSI:qDRAFT
" guifont=Lucida_Console:h10:cANSI:qDRAFT
" guifont=Lucida_Sans_Typewriter:h10:cANSI:qDRAFT
" guifont=Inconsolata_SemiExpanded:h10:cANSI:qDRAFT
" guifont=Inconsolata:h10:cANSI:qDRAFT
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Consolas\ 10
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
	endif
endif

"高亮显示当前行
set cursorline
hi CursorLine gui=NONE guibg=#585858 guifg=NONE
set cursorcolumn
hi CursorColumn gui=NONE guibg=#585858 guifg=NONE

"使用空格替换tab, 注意编写Makefile时执行命令的行的开头不能用空格
set expandtab

"所有的tab和缩进均为4个空格
set tabstop=4

"使用'<<'和'>>'移动时的宽度为4
"设置软宽度
set shiftwidth=4

"使用退格键(Backspace)时一次可以删除4个空格
set softtabstop=4
set smarttab

"让退格键能够删除文本
set backspace=indent,eol,start

"自动缩进
set autoindent

"智能缩进
"set smartindent

"自动换行，方便显示
set wrap

"行内替换
set gdefault

"增强模式中的命令行自动完成操作
set wildmenu

"显示标尺
set ruler

"设置命令行的高度
set cmdheight=1

"allow more tabs to be opened
set tabpagemax=50

"设置窗口大小
set lines=55
set columns=180

"显示行数
set number

"高亮显示匹配的括号
set showmatch

"匹配括号高亮的时间(单位是十分之一秒)
set mat=50

"光标移动到buffer的顶部和底部时保持X行举例
set scrolloff=5

"搜索字符逐渐高亮
set hlsearch
set incsearch

"搜索时不区分大小写
set ignorecase

" set timeout length for combinational command
set timeoutlen=7500

"用浅色高亮显示当前行
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"输入的命令显示出来，看得清楚
set showcmd

"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gbk2312,cp936

"设置文件编码
if has("win32")
	set fileencodings=chinese
else
	set fileencodings=utf-8	
endif

"解决菜单栏乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle提示信息输出乱码
language messages zh_CN.utf-8

"设置终端编码
set termencoding=utf-8

"设置语言编码
set langmenu=zh_CN.UTF-8
set helplang=cn

"处理未保存或只读文件时需要确认
set confirm

"切换buffer时不需要把已经更改过的buffer先保存
set hidden

"显示状态栏，默认值为1，表示不显示
set laststatus=2

"状态栏显示的内容
set statusline=%F%m%r%h%w[FORMAT=%{&ff}][TYPE=%Y][POS=%l,%v][%p%%]

"共享剪贴板
set clipboard+=unnamed

" 备份?
" set nobackup
" set noswapfile

"自动保存
set autowrite

"设置前缀按键
let mapleader=','

"设置一些快捷方式
"将vim的路径指向当前打开的文件，并且在状态栏显示当前路径
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
"重新加载.vimrc/_vimrc
"for Windows
"for Linux
if has("win32")
	nnoremap <leader>ee :source $VIM/_vimrc<CR>
else
	nnoremap <leader>ee :source ~/.vimrc<CR>
endif


"重新高亮当前行(有时候高亮会失效)
nnoremap <leader>ll :set cursorline<CR> :hi CursorLine gui=NONE guibg=#585858 guifg=NONE<CR>

" ==================================================================================================================================
" Settings for plugins
" netrw
" 在新的tab中打开新文件
let g:netrw_browse_split=3

" rainbow
" set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 


" NERDTree
" autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" shortcut for open/close NERDTree
map <C-n> :NERDTreeToggle<CR>

" shorcut for CtrlP
map <C-p> :CtrlP<CR>
