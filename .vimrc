if &compatible
  set nocompatible
endif

" dein.vim
set runtimepath+=~/.vim/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-repeat')
call dein#add('w0rp/ale')
call dein#add('pangloss/vim-javascript')

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('elixir-editors/vim-elixir')
call dein#add('JuliaEditorSupport/julia-vim')
call dein#add('vim-scripts/taglist.vim')
call dein#add('szw/vim-tags')
call dein#add('w0ng/vim-hybrid')
call dein#add('tpope/vim-rails')
call dein#add('aklt/plantuml-syntax')
call dein#add('posva/vim-vue')

call dein#end()

"pluginのインストール
if dein#check_install()
  call dein#install()
endif
let g:dein#auto_recache = 1

" たまに dein 自体を update すると良い
" cd ~/.vim/dein.vim/
" git pull
" アップデートもできる
" :call dein#update()
" アンインストールしたい場合は下記を実行する
" :call dein#recache_runtimepath()

set fileencoding=utf-8                        " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac                  " 改行コードの自動判別. 左側が優先される
set ambiwidth=double                          " □や○文字が崩れる問題を解決
set nobackup                                  " バックアップファイルを作らない
set noswapfile                                " スワップファイルを作らない
set autoread                                  " 変更を自動で読みなおす
set hidden                                    " バッファが編集中でも他のファイルを開ける
set showcmd                                   " 入力中のコマンドをステータスに表示する
set number                                    " 行番号表示
set cursorline                                " 現在行を強調表示
set cursorcolumn                              " 現在列を強調表示
set virtualedit=onemore                       " 行末の1文字先までカーソルを移動できるように
set visualbell                                " ビープ音を可視化
set showmatch                                 " 括弧入力時の対応する括弧を表示
set laststatus=2                              " ステータスラインを常に表示
set wildmode=list:longest                     " コマンドラインの補完
set wildmenu                                  " コマンドモードの補完

" netrw
let g:netrw_liststyle = 3                     " netrw をツリー表示にする
let g:netrw_winsize = 75                      " 画面分割して表示するときの window の割合
let g:netrw_browse_split = 2                  " Enter を押したときに新しい window で開く (垂直分割)

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
set autoindent                " 一つ前の行に基づくインデント
set cindent                   " 最も賢いらしい

filetype plugin indent on

highlight Normal ctermbg=none
set clipboard&
set clipboard^=unnamedplus    " CLIPBOARD と連動させる (Mac の場合は unnamed を指定する)

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
set background=dark
colorscheme hybrid
" autocmd FileType ruby colorscheme elflord
" autocmd FileType julia colorscheme elflord
syntax enable
hi Normal guibg=NONE ctermbg=NONE

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

" タグジャンプ先に複数の候補がある場合、選択肢を表示するためのバインド変更
nnoremap <C-]> g<C-]>
nnoremap <C-w>] <C-w>g<C-]>
nnoremap <C-w><C-]> <C-w>g<C-]>

" git commit 時のコミットメッセージ編集
autocmd FileType gitcommit DiffGitCached | resize 35

" grep
set grepprg=grep\ -rnIH\ --exclude-dir=.git

" grep した結果を Quickfix ウィンドウに表示する
autocmd QuickFixCmdPost *grep* cwindow


" タブページ: 前のタブへ移動
nnoremap gr gT

