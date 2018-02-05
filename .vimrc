"""""""""""""""""""""""""""""""""""""""""""""""""""
"Author: Evan                                     "
"Email: destinyjingkun@gmail.com                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""
"-Vundle插件安装-----------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"-主题类
"Plugin 'junegunn/seoul256.vim'
Plugin 'mhinz/vim-janah'
"-窗口类
"--底部导航栏
Plugin 'vim-airline/vim-airline'
"--文件树
Plugin 'scrooloose/nerdtree'        "文件管理器，方便编辑文件
Plugin 'majutsushi/tagbar'          "查看当前代码文件中的变量和函数列表
"-检索类
"--快速检索
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'  "在当前文件中快速移动光标到指定查找位置的插件
"-辅助类
"Plugin 'Shougo/neocomplcache.vim'
"Plugin 'mhinz/vim-startify'             "Vim开屏画面
Plugin 'Valloric/YouCompleteMe'          "代码补全
Plugin 'jiangmiao/auto-pairs'            "括号补全
Plugin 'tpope/vim-surround'              "快速给词加环绕符号
Plugin 'nathanaelkane/vim-indent-guides' "代码对齐引导条
Plugin 'ianva/vim-youdao-translater'     "有道翻译
"-开发类
"--GolangPlugin
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

"-公共设置-----------------------------------------
"-设置编码
set encoding=utf8
"-在状态行里显示 (部分) 命令
set showcmd
set backspace=2 "解决vim下delete键无法使用问题
"-设置<leader>键
let mapleader = ";"
"set guifont=Firacode:h30:w5:b    "Font Size
set linespace=3                  "行间距
"-设置缩进
set expandtab smarttab
set tabstop=2 softtabstop=2 shiftwidth=2
set autoindent cindent smartindent shiftround
"-行号
set number
set numberwidth=5
"-当前行高亮
au WinLeave * set nocursorline        "nocursorcolumn
au WinEnter * set cursorline          "cursorcolumn
set cursorline
"-普通map
noremap q :q<cr>
"-切换窗口
"noremap tp <C-W>p
"<leader>map
noremap <silent><leader>q :wq<cr>
noremap <silent><leader>w :w<cr>
inoremap <silent><leader>e <ESC>A
inoremap <silent><leader>b <ESC>I

"-插件设置-----------------------------------------
"-主题类 
syntax enable
"colo seoul256
"set background=dark
"let g:seoul256_background = 233
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah
"-窗口类
"--NerdTree
map nt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1            "NERDTREE显示隐藏文件
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
"--Tagbar
nmap tb :TagbarToggle<CR>
let g:tagbar_width=30
"--Airline
set laststatus=2 "永远显示状态栏
set t_Co=256"
"-检索类
"--CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"--neocomplete自启动
"let g:neocomplete#enable_at_startup = 1
"--YouCompleteMe
let g:ycm_key_list_stop_completion = ['<CR>'] "YCM按enter换行问题
"--vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
"--EasyMotion
nmap <leader>s <Plug>(easymotion-F)
nmap <leader>f <Plug>(easymotion-f)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)
nmap <leader>h <Plug>(easymotion-h)
nmap <leader>l <Plug>(easymotion-l)
"--有道翻译
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <leader>t :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>
