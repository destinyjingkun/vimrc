""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Username: Evan
"Email: destinyjingkun@gmail.com

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[ 公共设置 ]
"设置编码
set encoding=utf8

"在状态行里显示 (部分) 命令
set showcmd

"设置<leader>键
let mapleader = ";"
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

"设置缩进
set expandtab smarttab
set tabstop=2 softtabstop=2 shiftwidth=2
set autoindent cindent smartindent shiftround

"行号
set number
set numberwidth=5

"当前行高亮
au WinLeave * set nocursorline        "nocursorcolumn
au WinEnter * set cursorline          "cursorcolumn
set cursorline

"交换区 & 备份
set noswapfile
set nobackup

"Tab标签
noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>
"noremap <silent><leader>t :tabnew<cr>
"noremap <silent><leader>g :tabclose<cr>
noremap <silent><leader>1 :tabn 1<cr>
noremap <silent><leader>2 :tabn 2<cr>
noremap <silent><leader>3 :tabn 3<cr>
noremap <silent><leader>4 :tabn 4<cr>
noremap <silent><leader>5 :tabn 5<cr>
noremap <silent><leader>6 :tabn 6<cr>
noremap <silent><leader>7 :tabn 7<cr>
noremap <silent><leader>8 :tabn 8<cr>
noremap <silent><leader>9 :tabn 9<cr>
noremap <silent><leader>0 :tabn 10<cr>
noremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>

"普通map
noremap q :q<cr>

"<leader>map
noremap <silent><leader>q :wq<cr>
noremap <silent><leader>w :w<cr>
inoremap <silent><leader>e <ESC>A
inoremap <silent><leader>b <ESC>I
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[ Vundle插件安装 ]
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"[ 主题类 ]
Plugin 'jpo/vim-railscasts-theme'

"[ 窗口类 ]
"底部导航栏
Plugin 'vim-airline/vim-airline'
"文件树
Plugin 'scrooloose/nerdtree'
"Plugin 'ctags.vim'
"类,变量及方法
Plugin 'majutsushi/tagbar'

"[ 文件类 ]
"重命名
Plugin 'danro/rename.vim'

"[ 检索类 ]
"快速检索
Plugin 'kien/ctrlp.vim'
"Ag是为了替换默认的grep
Plugin 'rking/ag.vim'

"[ 辅助类 ]
"快速注释
Plugin 'scrooloose/nerdcommenter'
"自动补全
Plugin 'Shougo/neocomplcache.vim'
"括号补全
Plugin 'jiangmiao/auto-pairs'
"语法检测
Plugin 'vim-syntastic/syntastic'

"[ Rails ]
"快速的在module, class, method中跳跃
"Plugin 'vim-ruby/vim-ruby'
"不装这个做毛线Rails
Plugin 'tpope/vim-rails'
"自动补全end关键字
Plugin 'tpope/vim-endwise'
"集成Bundler
Plugin 'tpope/vim-bundler'
"集成Rspec测试
Plugin 'thoughtbot/vim-rspec'

"[ Html,Js ]
"神器Emmet的Vim版
Plugin 'mattn/emmet-vim'

call vundle#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"[ 插件设置 ]

"[ 主题类 ]
syntax enable
colorscheme railscasts

"[ 窗口类 ]
"NerdTree
map tt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1            "NERDTREE显示隐藏文件
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"

"airline
set laststatus=2 "永远显示状态栏
set t_Co=256"

"tarbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap tb :TagbarToggle<CR>

"[ 检索类 ]
"CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Ag设置
let g:ackprg = 'ag --nogroup --nocolor --column'

"[ Rails ]
"Vim Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
