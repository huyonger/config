" 常用设置
" 设置行号
set number
colorscheme default
" 按F2进入粘贴模式
set pastetoggle=<D-2>
" 高亮搜索
set hlsearch
" 设置折叠方式
set foldmethod=indent
" 高亮代码
syntax on
" 直接复制到剪贴板
set clipboard=unnamed

" 一些方便的映射
let mapleader=','
let g:mapleader=','
" 使用jj进入normal模式
inoremap jj <Esc>`^
" 使用leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>
" 切换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> [n :bnext<CR>
" use ctrl+h/j/k/L switch window
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null
" json格式化
com! FormatJSON %!python3 -m json.tool

" nerdtree settings
nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
" set width
let NERDTreeWinSize=31
" show hidden files
let NERDTreeShowHidden=1
" not show files listed
let NERDTreeIgnore= [
             \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.swp$',
             \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
             \ ]

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" easymotion
nmap ss <Plug>(easymotion-s2)
" 插件
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
call plug#end()

set fileencodings=ucs-bom,utf-8,gbk,gb2312,cp936,gb18030,big5,latin-1
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
