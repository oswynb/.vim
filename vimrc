set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" screen magic
"autocmd BufEnter * let &titlestring = expand("%:t")
"if &term == "screen"
"   set t_ts= k
"   set t_fs= \
"endif
if &term == "screen" || &term == "xterm"
  set title
endif

"highlighting groups
:map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" ide-like autocomplete
set completeopt=longest,menuone
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" cscope/ctags finding
set tags=tags;/
function! LoadCscope()
let db = findfile("cscope.out", ".;")
   if (!empty(db) && db != "cscope.out")
       let path = strpart(db, 0, match(db, "/cscope.out$"))
       set nocsverb
       exe "cs add " . db . " " . path
       set csverb
   endif
endfunction
au BufEnter * call LoadCscope()

" indents
set cindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set nu

" purty colors
colorscheme slate
syntax enable
highlight Pmenusel term=reverse ctermfg=0 ctermbg=1
highlight Comment ctermfg=Magenta cterm=none
set hlsearch

" ewww mouse
set mouse=a

" tab mappings
nmap <S-Tab> :tabp<CR>
nmap <Tab> :tabn<CR>
nmap <C-N> :tabnew<CR>
" convenience mappings
nmap <silent> <C-C> :s/^/\/\//<enter>:s/^\/\/\/\///e<enter>
vmap <silent> <C-C> :s/^/\/\//<enter>gv:s/^\/\/\/\///e<enter>
nmap <CR> O<Esc>
imap <C-]> <Esc><C-]>
nnoremap <C-T> <C-T>:tags<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
