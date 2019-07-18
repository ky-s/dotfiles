if &compatible
  set nocompatible
endif

" dein.vim
set runtimepath+=~/.vim/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('elixir-editors/vim-elixir')
call dein#add('JuliaEditorSupport/julia-vim')
call dein#add('vim-scripts/taglist.vim')
call dein#add('szw/vim-tags')

call dein#end()

set fenc=utf-8              " 文字コードUTF-8
set nobackup                " バックアップファイルを作らない
set noswapfile              " スワップファイルを作らない
set autoread                " 変更を自動で読みなおす
set hidden                  " バッファが編集中でも他のファイルを開ける
set showcmd                 " 入力中のコマンドをステータスに表示する


set number                  " 行番号表示
set cursorline              " 現在行を強調表示
set cursorcolumn            " 現在列を強調表示
set virtualedit=onemore     " 行末の1文字先までカーソルを移動できるように
set visualbell              " ビープ音を可視化
set showmatch               " 括弧入力時の対応する括弧を表示
set laststatus=2            " ステータスラインを常に表示
set wildmode=list:longest   " コマンドラインの補完

" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

set listchars=tab:>-,trail:~  " タブを >--- 半角スペースを ~ で表示する
set expandtab                 " Tab文字を半角スペースにする
set tabstop=2                 " 行頭以外のTab文字の表示幅
set shiftwidth=2              " 行頭でのTab文字の表示幅

set list
set softtabstop=2
set showtabline=2

" インデント設定
set smartindent
set autoindent                "一つ前の行に基づくインデント
set cindent                   "最も賢いらしい

filetype plugin indent on     "これがないと ruby のインデントをしてくれなかった

highlight Normal ctermbg=none
set clipboard=unnamed,autoselect

" 検索系
set ignorecase                          " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase                           " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                           " 検索文字列入力時に順次対象文字列にヒットさせる
set wrapscan                            " 検索時に最後まで行ったら最初に戻る
set hlsearch                            " 検索語をハイライト表示
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" ESC連打でハイライト解除

" ------------------------------------
"  colorscheme
" ------------------------------------
colorscheme molokai
autocmd FileType ruby colorscheme elflord
autocmd FileType julia colorscheme elflord
syntax on

" カーソル位置を記憶
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" ;をつけると親ディレクトリを探しに行くので、
" プロジェクトのルートディレクトリに tags を置いておけば良い
set tags=./tags;              " タグファイル
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1

