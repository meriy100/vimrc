if filereadable(expand('~/.vim/autoload/plug.vim'))
  source ~/.vimrc.plugins
endif

" クリップボード
set clipboard+=unnamedplus
set clipboard+=unnamed

"title を表示
set title

"ルーラーを表示
set ruler

"行番号を表示
set number

"タブの代わりに半角スペース
set expandtab

"タブ2文字分
set tabstop=2
set softtabstop=2
set shiftwidth=2

" swp ファイルなし
set nobackup
set noswapfile

"encoding = utf
set encoding=utf-8

" 保存する時の文字コード
set fileencoding=utf-8
scriptencoding utf-8

" 開く時の文字コード
set fileencodings=utf-8,cp932,euc-jp
" 端末の文字コード
set termencoding=utf-8
"backspace で改行、インデント、以前入力した文字を削除できるようにする
set backspace=indent,eol,start

" 文頭や文末で左右に動いたら次の行や前の行にいけるようにする
set whichwrap=b,s,h,l,<,>,[,]

" タブ文字とか半角とか色々を可視化
set list
set lcs=tab:>.,trail:_,extends:\

" 外部でファイルに変更がされた場合は読みなおす
set autoread


"折りたたみ
set foldmethod=indent
set foldlevel=2

" () {} などの補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" カーソル形状変化
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" 日本語ヘルプを利用する
set helplang=ja,en

" Other
set scrolloff=12
set modeline
set mouse=a
set incsearch
set nohlsearch
set autoindent
set wildmenu
set ttimeout
set ttimeoutlen=50


autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
autocmd BufNewFile,BufRead .pryrc     set filetype=ruby


" keymap

inoremap <silent> jj <ESC>

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e
nnoremap <Leader>j% :vsplit<CR>
nnoremap <Leader>j" :split<CR>
nnoremap <Leader>jh <C-w>h<CR>
nnoremap <Leader>jh <C-w>h<CR>
nnoremap <Leader>jj <C-w>j<CR>
nnoremap <Leader>jk <C-w>k<CR>
nnoremap <Leader>jl <C-w>l<CR>

nnoremap ; :

" color

if (has('termguicolors'))
  set termguicolors
endif
syntax on
set background=dark

colorscheme material
highlight Comment  guifg=#BFBFBF ctermfg=251
highlight Visual   term=reverse ctermfg=231 ctermbg=239 guifg=#eeffff guibg=#314549
highlight LineNr   term=underline ctermfg=251 guifg=#BFBFBF

" CtrP settings
let g:ctrlp_map = '<Nop>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <Leader>o :CtrlP<CR>

" IndentLine
" Vim
let g:indentLine_color_term = 251

" GVim
let g:indentLine_color_gui = '#BFBFBF'

" winresizer
let g:winresizer_vert_resize=3
let g:winresizer_horiz_resize=1


" NERDTree
let NERDTreeShowHidden=1 " 隠しファイル表示
nnoremap <Leader>1 :NERDTree<CR>


" deopleate
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('buffer',
\ 'min_pattern_length', 100)

call deoplete#custom#option({  'max_list': 10
\ })
