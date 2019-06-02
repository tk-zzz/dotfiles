syntax on
set encoding=utf-8
scriptencoding utf-8

set number
set ruler
set title

set cursorline
set virtualedit=onemore
set smartindent
"set visualbell"
set showmatch
set laststatus=2
set wildmode=list:longest

set t_Co=256
":split :spで新たに開くファイルを画面下に開く
set splitbelow
":split :spで新たに開くファイルを画面右に開く
set splitright

nnoremap j gj
nnoremap k gk
nnoremap <DOWN> gj
nnoremap <UP> gk
nnoremap W b
vnoremap W b
nnoremap gr gT
nnoremap - $
nnoremap <TAB> >>
"nnoremap <C-TAB> <<"
nnoremap <ESC><ESC> :nohl<CR>
"n or Nで次検索結果に飛んだときに、結果を画面の中心に持ってくるようになる。
nnoremap n nzz
nnoremap N Nzz

"vsでvsした後一番右に開くのが嫌だったけど↓だとうまく治らなかった。
"cnoremap vs vs <C-w>

"コマンドラインで%%を入力するとカレントディレクトリに置き換えられる。
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

set list listchars=tab:\>\-
set expandtab
set tabstop=4
set shiftwidth=4

"検索文字列が小文字の場合は大文字小文字を区別しない"
set ignorecase
"検索文字列に大文字が含まれる場合は区別して検索"
set smartcase

set hlsearch
set incsearch

highlight ColorColumn ctermbg=16"

nnoremap <ESC><ESC> :nohl<CR>

execute "set colorcolumn=" . join(range(101, 1000), ',')

"https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
"|cwを末尾につけなくても、:vimgrepだけでなく:grep :GgrepでもQucikFixが開かれる
autocmd QuickFixCmdPost *grep* cwindow

colorscheme molokai

"nnoremap <expr> / _(":%s/<Cursor>/&/gn")

"function! s:move_cursor_pos_mapping(str, ...)
" let left = get(a:, 1, "<Left>")
" let lefts = join(map(split(matchstr(a:str, '.*<Cursor>\zs.*\ze'), '.\zs'), 'left'), "")
" return substitute(a:str, '<Cursor>', '', '') . lefts
"endfunction
"
"function! _(str)
" return s:move_cursor_pos_mapping(a:str, "\<Left>")
"endfunction

"function! VerticalSplitAndThrowToRight(...)
" if a:0 >= 1
" " vs path
" echo .a:1
" else
" vs
" end
"endfunction

function! Unko()
echo "unko!"
endfunction
