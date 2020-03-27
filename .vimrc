"""""""""""""""""""""""""""""""""""""""""""""""""""
"Author: Evan                                     "
"Email: destinyjingkun@gmail.com                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""
"-Plugin Install-----------------------------------
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
"参数说明: on 首次加载插件的时候调用, for
"指定加载哪种类型文件的时候才加载插件,加快Vim的启动速度
Plug 'junegunn/seoul256.vim'
"Plug 'mhinz/vim-janah'                  "主题
"Plug 'fatih/molokai'
"Plug 'joshdick/onedark.vim'             "Atom的OneDark主题
"Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'          "底部导航栏
"--文件树
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}            "文件管理器，方便编辑文件
Plug 'majutsushi/tagbar'                "查看当前代码文件中的变量和函数列表
"--快速检索
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'        "在当前文件中快速移动光标到指定查找位置的插件
"Plug 'justinmk/vim-sneak'
"-辅助类
"Plug 'Valloric/YouCompleteMe'           "代码补全
Plug 'terryma/vim-multiple-cursors'     "多光标输入<C-n>贼好用
Plug 'jiangmiao/auto-pairs'             "括号补全
Plug 'tpope/vim-surround'               "快速给词加环绕符号
Plug 'scrooloose/nerdcommenter'         "快速注释
Plug 'nathanaelkane/vim-indent-guides'  "代码对齐引导条
Plug 'AndrewRadev/splitjoin.vim'        "代码结构体拆分,拆分(gS)需要在代码块内,(gJ)合并需要在代码块外
"Plug 'ianva/vim-youdao-translater'      "有道翻译
"Plug 'junegunn/limelight.vim'           "关灯模式
Plug 'tpope/vim-fugitive'               "Git
Plug 'airblade/vim-gitgutter'           "git修改过的行高亮
"Plug 'terryma/vim-expand-region'        "V模式快速选择
"-开发类
Plug 'fatih/vim-go'                     "Golang Develop Tool
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'sebdah/vim-delve'
Plug 'mattn/emmet-vim'
"Plug 'SirVer/ultisnips'                 "片段(代码块)引擎
"Plug 'honza/vim-snippets'               "片段(代码块)库
"-Flutter移动端开发
Plug 'thosakwe/vim-flutter'             "开发Flutter移动端应用,支持热加载
Plug 'dart-lang/dart-vim-plugin'
"Plug 'noahfrederick/vim-composer'
"Plug 'noahfrederick/vim-laravel'
call plug#end()
filetype plugin indent on

"-公共设置-----------------------------------------
set encoding=utf8                       "设置编码
set splitright                          "设置分屏从右边,默认从左边
"set macligatures
set ignorecase                          "搜索忽略大小写
set guifont=Fira\ Code:h12
set helplang=cn                         "中文帮助文档
set showcmd                             "右下角显示命令行
"set foldmethod=syntax                   "代码折叠方式
set foldlevelstart=99
set foldmethod=indent                   "代码折叠方式
"set foldnestmax=1
set backspace=eol,start,indent          "解决Vim下delete键问题
set wildmode=list:longest               "命令行模式Tab补全
let mapleader = ";"                     "设置<leader>键
set expandtab smarttab                  "设置缩进
set tabstop=2 softtabstop=2 shiftwidth=2
au BufRead,BufNewFile *.php set tabstop=4 softtabstop=4 shiftwidth=4
set autoindent cindent smartindent shiftround
set number                              "显示行号
set numberwidth=5                       "行号宽度
au WinLeave * set nocursorline          "当前行高亮
au WinEnter * set cursorline          
set cursorline
"-普通map
"noremap q :q<cr>
"-插入模式
imap jj <ESC>
"--切换窗口
noremap cp <C-W>w
"<leader>map
noremap <silent><leader>q :q<cr>
noremap <silent><leader>w :w<cr>
inoremap <silent><leader>e <ESC>A
inoremap <silent><leader>b <ESC>I
" vim-go
noremap <silent><leader>gt :GoTest<cr>
" delve
noremap <silent><leader>da :DlvAddBreakpoint<cr>
noremap <silent><leader>dr :DlvRemoveBreakpoint<cr>
noremap <silent><leader>r :DlvDebug<cr>
"vue file hightlight
au BufRead,BufNewFile *.vue set filetype=html
"-插件设置-----------------------------------------
"-主题类 
"theme seoul256---
syntax enable
set t_Co=256
let g:seoul256_background = 235
colo seoul256
set background=dark

"them molikai---
"set t_Co=256
"set background=dark
"let g:molokai_original = 1
"let g:rehash256 = 1
"colorscheme molokai

"theme atom one dark---
"if (has("termguicolors"))
 "set termguicolors
"endif
"set t_Co=256
"colorscheme onedark

"theme janah---
"autocmd ColorScheme janah highlight Normal ctermbg=235
"colorscheme janah
"-窗口类
"--NerdTree
map nt :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1            "NERDTREE显示隐藏文件
let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc', '\.swp', '\.git', '\.idea']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
"--Tagbar
nmap tb :TagbarToggle<CR>
let g:tagbar_compact = 1              "隐藏帮助
let g:tagbar_width=30                 "窗口宽度
let g:tagbar_sort = 1                 "如果设置此选项，则标签将根据其名称进行排序
"--Airline
set laststatus=2 "永远显示状态栏
"-检索类
"--CtrlP
set wildignore+=*/tmp/*,*/vendor/*,*.so,*.swp,*.swap,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"--YouCompleteMe
"let g:ycm_key_list_select_completion = ['<S-j>', '<Down>']  "解决跟UltiSnips冲突
"let g:ycm_key_list_previous_completion = ['<S-k>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_key_list_stop_completion = ['<CR>'] "YCM按enter换行问题
"let g:ycm_autoclose_preview_window_after_completion = 1 "补全之后自动关闭
"--vim-indent-guides
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"--EasyMotion
"nmap <leader>s <Plug>(easymotion-F)
"nmap <leader>f <Plug>(easymotion-f)
"nmap <leader>j <Plug>(easymotion-j)
"nmap <leader>k <Plug>(easymotion-k)
"nmap <leader>h <Plug>(easymotion-h)
"nmap <leader>l <Plug>(easymotion-l)
"--有道翻译
"vnoremap <leader>t :<C-u>Ydv<CR>
"nnoremap <leader>t :<C-u>Ydc<CR>
"--Limelight
"--vim-gitgutter
set updatetime=250                            "默认4s改250ms
"vim-go
let g:go_highlight_structs = 0 
let g:go_highlight_methods = 0
let g:go_highlight_functions = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 0
"let g:go_fold_enable = ['block', 'varconst', 'package_comment']
"let g:go_code_completion_enabled = 1
"let g:go_fmt_experimental = 1
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet']  ", 'errcheck''golint',
let g:go_auto_type_info = 0                   "自动提示类型
let g:go_auto_sameids = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
"Emmet
let g:user_emmet_mode='inv'
"UltiSnips
let g:UltiSnipsJumpForwardTrigger="<C-j>"     "向前选择
let g:UltiSnipsJumpBackwardTrigger="<C-k>"    "向后选择
"multiple-cursors
let g:multi_cursor_use_default_mapping=0
" Default mapping
"let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<S-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" Vimshell setting
let g:vimshell_popup_command = "vsplit"       "默认是水平,改垂直风格
let g:vimshell_prompt="▶ "                    "默认提示符vimshell%
