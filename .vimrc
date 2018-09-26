" インデント設定
set smartindent
set autoindent
" バックステップの動作
set backspace=2
" クリップボード
set clipboard=unnamed,autoselect
" 終了時の確認
set confirm
" コマンド記録数
set history=5000
" 検索結果をハイライト
set hlsearch
" 検索で大文字小文字を区別
set ignorecase
set smartcase
" インクリメントサーチ
set incsearch
" 常にステータスラインを表示
set laststatus=2
" 行番号を表示
set number
" タイトルを表示
set title
" カーソルラインをハイライト
set cursorline
" 対応する括弧を表示
set showmatch
set matchtime=1
" ビープ音無効
set visualbell t_vb=
" フリーカーソル
set virtualedit=all
" 構文ハイライト
syntax enable
" タブ関連
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" ファイル名補完
set wildmenu
" ESC2回でハイライト切替
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" マウス
set mouse=a
set ttymouse=xterm2
" 折り返し時に表示行単位で移動
nnoremap j gj
nnoremap k gk
" 入力中のコマンドを表示
set showcmd

" dein.vim
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

	call dein#add('w0ng/vim-hybrid')
	call dein#add('itchyny/lightline.vim')
  call dein#add('Yggdroot/indentLine')
" call dein#add('Shougo/vimproc.vim', {'build': 'make'})
"	call dein#add('Shougo/unite.vim')
"	call dein#add('thinca/vim-quickrun')
"  if has('lua')
"	  call dein#add('Shougo/neocomplete.vim')
"    call dein#add('Shougo/neosnippet.vim')
"	  call dein#add('Shougo/neosnippet-snippets')
"    call dein#add('honza/vim-snippets')
"  endif
"	call dein#add('tpope/vim-surround')
"	call dein#add('airblade/vim-gitgutter')
" call dein#add('tpope/vim-endwise')
"	call dein#add('Townk/vim-autoclose')
"	call dein#add('bronson/vim-trailing-whitespace')
"	" call dein#add('')

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

""source $VIMRUNTIME/macros/matchit.vim
""let b:match_words = '<:>,<div.*>:</div>,do:end'
"
"" matchitを有効化
"if !exists('loaded_matchit')
"  runtime macros/matchit.vim
"endif

" 色をhybridに変更
set background=dark
colorscheme hybrid

"" QuickRun
"nnoremap Q :QuickRun<CR>
"
"" Neocomplete設定
"let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/honza/vim-snippets/snippets'
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 1
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"  " For no inserting <CR> key.
"  return pumvisible() ? "\<C-y>" : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"" AutoComplPop like behavior.
""let g:neocomplete#enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplete#enable_auto_select = 1
""let g:neocomplete#disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"" Plugin key-mappings.
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
"" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"
"" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif
"

" ファイルタイプ
filetype plugin indent on
