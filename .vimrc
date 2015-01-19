"execute pathogen#infect()
filetype plugin on
set invhlsearch					      " Inversesearch			
set number                          " Set linenumber
set shiftwidth=4                    " Indentation
set tabstop=4                       " One tab == 3 spaces
set smartindent                     " Set smartindent
set expandtab                       " All spaces as tabs
set softtabstop=4                   " Make backspace work on 'tabs'
set ruler                           " Infobar at bottom
set modelines=0                     " Disable modelines
set undofile                        " Activate undofile
set gdefault                        " %s/LOL/HERP/ is now %s/LOL/HERP/g
colorscheme elflord
syntax on                           " Syntax highlighting
let mapleader = ","                 " remap leaderkey
" Shortcuts to go to EOL/Beginning of line ===========================
map  <C-E>      $
imap <C-E>      <C-O>$
" Make bracketmatching with tab 
nnoremap <tab> %
vnoremap <tab> %
" Make j/k move through visible lines ================================
noremap k gk
noremap j gj
" Shift +j/k for moving around quickly ===============================
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k
" Fix vims horrible (default) regexhandling =====================
nnoremap / /\v
vnoremap / /\v

" Handle long lines (correctly
set wrap
"set nowrap
set textwidth=0
"set wrapmargin=0
set formatoptions=cqt
"set formatoptions=qrn1
" set colorcolumn=85
nnoremap <F3> :set hlsearch!<CR>
" leaderfunctions
noremap <Leader>[ a<C-o>b[<C-o>e<C-o>l]<Esc>
noremap <Leader>( a<C-o>b(<C-o>e<C-o>l)<Esc>
noremap <Leader>< a<C-o>b<<C-o>e<C-o>l><Esc>
noremap <Leader>" a<C-o>b"<C-o>e<C-o>l"<Esc>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P



" Hoppa ur search
:nnoremap <cr> :nohlsearch<cr>


" Latex


" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=gssrep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat='pdf'



" Relative numbering
set relativenumber
set lazyredraw
set ruler
set nrformats=


" Clipboard, p och y går till x clipboard
set clipboard=unnamedplus
