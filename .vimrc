set enc=utf-8
set fenc=utf-8
set number
set smartindent
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set smartcase

set nowrapscan
set incsearch
set hlsearch
set nowrap
set showmatch

syntax on

" golang omnicomplete
setlocal omnifunc=syntaxcomplete#Complete
if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

" alias
nnoremap <silent> <C-L> :noh<C-L><CR>
