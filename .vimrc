"my modifition
"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>ss :source /Users/yedeying/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>ee :e /Users/yedeying/.vimrc<cr>
"Fast update vimrc in root
map <silent> <leader>dd :!cp /Users/yedeying/.vimrc /root/.vimrc
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source /Users/yedeying/.vimrc

"undo持久化
if has('persistent_undo') "check if your vim version supports it
    set undofile "turn on the feature
    set undodir=$HOME/.vim/undo "directory where the undo files will be stored
endif

"设置编码
set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set fileencodings=utf-8,ucs-bom,chinese
set listchars=tab:>-,trail:-,extends:>,precedes:<
set list
set hls

"语言设置
set langmenu=zh_CN.UTF-8

"设置语法高亮
syntax enable
syntax on

"设置配色方案
set background=dark
"colorscheme torte
"colorscheme molokai
colorscheme hybrid
"colorscheme dracula
"colorscheme solarized
"colorscheme OceanicNext
"colorscheme onedark

"可以在buffer的任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set number

"高亮显示匹配的括号
set showmatch

"去掉vi一致性
set nocompatible

"设置缩进
set ts=4
set expandtab
"set tabstop=4
"set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif

"打开文件类型自动检测功能
filetype on

"设置taglist
let Tlist_Show_One_File=0   "显示多个文件的tags
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "在taglist是最后一个窗口时退出vim
let Tlist_Use_SingleClick=1 "单击时跳转
let Tlist_GainFocus_On_ToggleOpen=1 "打开taglist时获得输入焦点
let Tlist_Process_File_Always=1 "不管taglist窗口是否打开，始终解析文件中的tag

"设置WinManager插件
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
map <silent> <F9> :WMToggle<cr> "将F9绑定至WinManager,即打开WimManager

"设置CSCOPE
set cscopequickfix=s-,c-,d-,i-,t-,e- "设定是否使用quickfix窗口显示cscope结果

"设置Grep插件
nnoremap <silent> <F3> :Grep<CR>

"设置一键编译
map <F6> :make<CR>

"设置自动补全
filetype plugin indent on   "打开文件类型检测
set completeopt=longest,menu "关掉智能补全时的预览窗口

"启动vim时如果存在tags则自动加载
if exists("tags")
    set tags=./tags
endif

"设置按F12就更新tags的方法
"map <F12> :call My_Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>

"设置默认shell
set shell=zsh

"设置VIM记录的历史数
set history=1000

"设置当文件被外部改变的时侯自动读入文件
if exists("&autoread")
    set autoread
endif

"设置ambiwidth
set ambiwidth=double

"设置文件类型
set ffs=unix,dos,mac

"设置增量搜索模式
set incsearch

"设置静音模式
set noerrorbells
set novisualbell
set t_vb=

"不要备份文件
set nobackup
set nowb

"auto complete bracket
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap ' ''<ESC>i
"inoremap " ""<ESC>i
"inoremap < <><ESC>i

imap [[ {<CR>}<ESC>ko
map [[ i<END> {<CR>}<ESC>ko
imap ]] [<CR>]<ESC>ko
map ]] i<END> [<CR>]<ESC>ko
imap \\ (<CR>)<ESC>ko
map \\ i<END> (<CR>)<ESC>ko
imap ;; <ESC>i<END>;
map ;; <ESC>i<END>;<ESC>
imap ,, <ESC>i<END>,
map ,, <ESC>i<END>,<ESC>
imap :fun :<SPACE>function<SPACE>()<SPACE>[[
map ,o o<ESC>k
map ,O O<ESC>j
" for emmet
imap <C-e> <C-y>,
imap <C-b> <ESC>vk$di
nmap <C-b> vk$d
nmap <C-h> ^
vmap <C-h> ^
imap <C-h> <ESC>^i
nmap <C-l> $
vmap <C-l> $
imap <C-l> <ESC>$i
nmap <C-t> <ESC>:set ts=2<CR>:set shiftwidth=2<CR>
nmap <C-y> <ESC>:set ts=4<CR>:set shiftwidth=4<CR>
imap <C-t> <ESC>:set ts=2<CR>:set shiftwidth=2<CR>I
imap <C-y> <ESC>:set ts=4<CR>:set shiftwidth=4<CR>I

" mac os cross window copy
vmap ,. :w !pbcopy<CR><CR>
nmap ,. :r !pbpaste<CR>
imap ,. <ESC>:r !pbpaste<CR>A

" tab switch
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>
noremap <leader>q :tabprevious<CR>
noremap <leader>w :tabnext<CR>

" move in split view
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <leader><space>h <C-w>H<C-w>l
nnoremap <leader><space>j <C-w>J<C-w>k
nnoremap <leader><space>k <C-w>K<C-w>j
nnoremap <leader><space>l <C-w>L<C-w>h

map <F4> <Esc>:%!python -m json.tool<CR>
imap <F4> <Esc>:%!python -m json.tool<CR>

map K <Nop>

hi TabLineSel ctermfg=Red

"设置bundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'Shougo/neocomplcache'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'othree/yajs.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-eunuch'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'zenorocha/dracula-theme'
Plugin 'vim-scripts/JavaScript-syntax'
Plugin 'digitaltoad/vim-pug'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'hushicai/fecs.vim.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
Plugin 'tyok/nerdtree-ack'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype indent plugin on

"设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 1
let g:php_cs_fixer_level = "psr2"
let g:php_cs_fixer_config = "default"
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 1
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_require = 0
let g:multi_cursor_exit_from_insert_mode = 0

"nerdcommenter

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDTrimTrailingWhitespace = 1

"syntastic
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set backspace=2
let g:syntastic_html_checkers = [""]
let g:syntastic_php_checkers = [""]

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['fecs']
let g:syntastic_javascript_fecs_args = "--rule"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0

nmap <F5> :SyntasticCheck<cr>
