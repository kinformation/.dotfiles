" カラースキーマ設定

syntax on
set t_Co=256
colorscheme desert

" 画面表示の設定

set number         " 行番号を表示する
set laststatus=2   " ステータス行を常に表示
set showmatch      " 対応する括弧を強調表示
"set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
" 不可視文字の表示記号指定
set listchars=tab:>-,trail:-

" カーソル移動関連の設定

set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
"set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
"set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
"set mouse=a                    " マウス操作有効化
"set ttymouse=xterm2            " マウスホイール有効化

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   " 外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定

set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする
" ハイライト色
hi IncSearch ctermfg=red ctermbg=Yellow term=bold,reverse cterm=bold
hi Search ctermfg=red ctermbg=Yellow term=bold,reverse cterm=bold
" Esc Esc でハイライトOFF
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" 「/」「?」「*」「#」が押されたらハイライトをONにしてから「/」「?」「*」「#」
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" タブ/インデントの設定

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定

" 挿入モードに入る時，前回の挿入モードにおける IME の状態を復元する
set t_SI+=[<r
" 挿入モードを出る時，現在の IME の状態を保存し，IME をオフにする
set t_EI+=[<s[<0t
" Vim 終了時，IME を無効にし，無効にした状態を保存する
set t_te+=[<0t[<s
" ESC キーを押してから挿入モードを出るまでの時間を短くする
set timeoutlen=100

" コマンドラインの設定

" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" ビープの設定

" ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" ESCをjjにマッピング
inoremap <silent> jj <ESC>

"-------------------------------------------------------------------------
" NeoBundle
" setup
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" plugins
" NeoBundle 'davidhalter/jedi-vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck
