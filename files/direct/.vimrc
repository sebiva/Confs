set shell=/bin/zsh


set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
set invhlsearch					      " Inversesearch
set hlsearch
set number                          " Set linenumber
set shiftwidth=4                    " Indentation
set tabstop=4                       " One tab == 1? spaces
set smartindent                     " Set smartindent
set expandtab                       " All spaces as tabs
set softtabstop=4                   " Make backspace work on 'tabs'
set ruler                           " Infobar at bottom
set modelines=0                     " Disable modelines
set undofile                        " Activate undofile
set gdefault                        " %s/LOL/HERP/ is now %s/LOL/HERP/g
set cursorline                      " Line for the cursor
colorscheme BenokaiPrime

"if $COLORTERM == 'gnome-terminal'

" For colors to work
set t_Co=256
"endif

" escape
inoremap jj <ESC>

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
"nmap J 5j
"nmap K 5k
"vmap J 5j
"vmap K 5k
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
set colorcolumn=80
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F6> :set paste!<CR>
" leaderfunctions
noremap <Leader>[ a<C-o>b[<C-o>e<C-o>l]<Esc>
noremap <Leader>( a<C-o>b(<C-o>e<C-o>l)<Esc>
noremap <Leader>< a<C-o>b<<C-o>e<C-o>l><Esc>
noremap <Leader>" a<C-o>b"<C-o>e<C-o>l"<Esc>
"vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P

"Shortcuts for switching buffers
set hidden
map <Leader>n   :bn<CR>
"imap <C-S>  <C-O>:bn<CR>
map <Leader>p   :bp<CR>
"imap <C-T>  <C-O>:bp<CR>

" Quick split switch
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

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
"let g:Tex_CompileRule_pdf='bibtex %:r & pdflatex -interaction=nonstopmode %:r & bibtex %:r & pdflatex -interaction=nonstopmode %:r'
"let g:Tex_CompileRule_pdf='latexmk -pdf %:r && latexmk -c %:r'

" Don't open log files automatically
let g:Tex_GotoError=0

" For the final report:
if ! empty(matchstr(expand('%:p'), "/home/or3x/Dropbox/Documents/Chalmers-Kurser/Thesis/thesis-report/.*"))
  let g:mainfile = expand(fnamemodify('main.tex', ':p'))
  let g:Tex_CompileRule_pdf='cd .. && latexmk -pdf -outdir=out/ -auxdir=out/ -pdflatex="pdflatex -shell-escape" ' . g:mainfile
elseif ! empty(matchstr(expand('%:p'), "/home/or3x/Dropbox/Documents/Chalmers-Kurser/Thesis/thesis-presentation/.*"))
  let g:mainfile = expand(fnamemodify('main.tex', ':p'))
  "let g:Tex_CompileRule_pdf='latexmk -pdf -outdir=out/ -auxdir=out/ -pdflatex="pdflatex -shell-escape" ' . g:mainfile
  let g:Tex_CompileRule_pdf='latexmk -pdf -outdir=out/ -auxdir=out/ -pdflatex="pdflatex -shell-escape" main.tex'
  let g:Tex_CompileRule_pdf='pdflatex -output-directory=out/ -shell-escape main.tex'
else
  let g:Tex_CompileRule_pdf='latexmk -pdf -outdir=out/ -auxdir=out/ %:r'
endif
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf,bib'

" Undo some latex-suite macros
let g:Imap_FreezeImap=1


" Relative numbering
set relativenumber
set lazyredraw
set ruler
set nrformats=


" Clipboard, p och y går till x clipboard
"set clipboard=unnamedplus
" single characters are not written to a register when deleted
noremap x "_x
" Airline
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1


" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.hi

" Syntactic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Fast tags
" Unfortunately silent means the errors look a little ugly, I suppose I could
" " capture those and print them out with echohl WarningMsg.
"au BufWritePost *.hs silent !init-tags %
"au BufWritePost *.hsc silent !init-tags %









" Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" Pane navigation
Bundle 'christoomey/vim-tmux-navigator'
" Commenting
Plugin 'scrooloose/nerdcommenter'
" Statusline
Plugin 'bling/vim-airline'
" Theme
Plugin 'ajh17/Spacegray.vim'
" Highlight whitespace
Bundle 'ntpeters/vim-better-whitespace'
" File finder
Plugin 'kien/ctrlp.vim'
" Git stuff
Plugin 'tpope/vim-fugitive'
" Syntastic
"Bundle 'scrooloose/syntastic'
"Vimplugin for Haskell
Plugin 'raichoo/haskell-vim'
" vimproc
Bundle 'Shougo/vimproc.vim'
" GHC mod
" Bundle 'eagletmt/ghcmod-vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Show git diff indicator in sidebar
Plugin 'airblade/vim-gitgutter'
" Center all text
Plugin 'junegunn/goyo.vim'
" Highligts the current paragraph
Plugin 'junegunn/limelight.vim'
" Thesaurus
Plugin 'beloglazov/vim-online-thesaurus'

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

"execute pathogen#infect()
"
"" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \  exe "normal g`\"" |
  \ endif


" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Erlang stuff
:set runtimepath^=$HOME/.vim_erlang_tags/vim-erlang-tags
:set tags^=$HOME/Thesis/find-example/tags
:set tags^=$HOME/Thesis/more-bugs/tags
:set tags^=$HOME/Thesis/vbox-share/eqc-dev/tags
:set tags^=$HOME/Thesis/vbox-share/eqc-dev/web/js/tags


" Make vim save .un~ and .swp files in $TEMP instead:
"set backupdir=$HOME/.tmp//
"set directory=$HOME/.tmp//
"set undodir=$HOME/.tmp//

nnoremap <F7> :GitGutterStageHunk<CR>
nnoremap <F8> :GitGutterPreviewHunk<CR>
nnoremap <F9> :GitGutterPrevHunk<CR>
nnoremap <F10> :GitGutterNextHunk<CR>
nnoremap <F12> :GitGutterRevertHunk<CR>

" Make # comments in python stay indented
autocmd BufRead *.py inoremap # X<c-h>#

" tags
set tags=./tags;
