" ==============================
" Username: Evan Chen
" Email: destinyjingkun@gmail.com
" ==============================

set nocompatible              " be iMproved, required
filetype off                  " required

" ==============================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" ========== 插件安装 ==========
" *--插件安装开始
call vundle#begin()
" *--必须安装，let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" *--github插件
" |--主题类
"Plugin 'sickill/vim-monokai'
"Plugin 'jpo/vim-railscasts-theme'
Plugin 'altercation/vim-colors-solarized'
" |--窗口类
Plugin 'vim-airline/vim-airline'			"底部导航栏
Plugin 'scrooloose/nerdtree'					"左侧文件树
"Plugin 'ctags.vim'
Plugin 'majutsushi/tagbar'						"类、变量及方法,一般我都是放右边
" |--文件操作类
Plugin 'danro/rename.vim'							"文件重命名
" |--检索类
Plugin 'kien/ctrlp.vim'								"快速检索
Plugin 'rking/ag.vim'									"替代默认的grep检索
" |--辅助类
Plugin 'scrooloose/nerdcommenter'			"快速注释
Plugin 'Shougo/neocomplcache.vim'			"自动补全
Plugin 'jiangmiao/auto-pairs'					"括号补全
Plugin 'vim-syntastic/syntastic'			"语法检测
" |--Rails开发类
"Plugin 'vim-ruby/vim-ruby'						"快速的在module, class, method中跳跃
Plugin 'tpope/vim-rails'							"不装这个做毛线Rails
Plugin 'tpope/vim-endwise'						"自动补全end关键字
Plugin 'tpope/vim-bundler'						"集成Bundler
" |--前端开发类
Plugin 'mattn/emmet-vim'							"快速生成标签
" *--插件安装结束
call vundle#end() 

" ========== 设置开始 ==========
" *--主题设置
syntax enable
set background=dark
colorscheme solarized "railscasts monokai

" *--公共设置
set fileencodings=utf-8								"文件编码
" set rnu "显示相对行号
set number														"行号设置
set numberwidth=6											"行号宽度
" |--空格设置
set backspace=2 											"设置推格键长度
set tabstop=2 												"设置tab键长度
set sw=2
set ts=2
set showcmd
" |--swap,备案文件设置 
set noswapfile											  "不要生成swap文件
set nobackup													"不生成备份
" |--编码区设置
" |--|--通用设置
"set textwidth=80
"set colorcolumn=+1
" |--|--当前行高亮
au WinLeave * set nocursorline			  "nocursorcolumn
au WinEnter * set cursorline					"cursorcolumn
set cursorline											  "cursorcolumn

" *--插件设置
"	|--NERDTree 插件配置
map tt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1						"NERDTREE显示隐藏文件
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" |--airline设置
set laststatus=2											"永远显示状态栏
set t_Co=256													"在windows中用xshell连接打开vim可以显示色彩
" |--tagbar设置
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap tb :TagbarToggle<CR>
" |--CtrlP检索设置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'"
" |--|--使用AG体改Grep检索
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" |--AG设置
let g:ackprg = 'ag --nogroup --nocolor --column'
" |--autocmd设置
" |--|--默认开启NerdTree
autocmd VimEnter * NERDTree
