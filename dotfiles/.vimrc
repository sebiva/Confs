set shell=/bin/bash  " zsh was causing problems (can't open tmp)

" ========================================================================
" Basic settings =========================================================
" ========================================================================
set nocompatible                " be iMproved, required
filetype indent plugin on       " required for latex and vundle
set backspace=indent,eol,start  " Make backspace work like it should in insert
set invhlsearch                 " Inversesearch
set hlsearch
set incsearch                   " Start searching while typing
set number                      " Set linenumber
set shiftwidth=4                " Indentation
set tabstop=8                   " One tab == 8 spaces
set smartindent                 " Set smartindent
set expandtab                   " All spaces as tabs
set softtabstop=4               " Make backspace work on 'tabs'
set modelines=0                 " Disable modelines
set undofile                    " Activate undofile
set gdefault                    " %s/abc/def/ is now %s/abc/def/g
set cursorline                  " Line for the cursor
colorscheme BenokaiPrime        " Theme
set t_Co=256                    " For colors to work
set wrap                        " Handle long lines correctly
set textwidth=0
set formatoptions=cqt
set colorcolumn=80
syntax on                       " Syntax highlighting
let mapleader = ","             " remap leaderkey
set relativenumber              " Relative numbering
set lazyredraw
set ruler                       " Ruler line
set clipboard=unnamedplus       " Clipboard, p and y go to X-clipboard
set switchbuf="useopen"         " Open buffers in the current tab, not in other
set autoread                    " Don't ask to load changed files (when changed
                                " in git for example), unless there are unsaved
                                " changes in the buffer.
set termguicolors               " Set full color support in terminal
" Make autoread work better when switching between buffers
au FocusGained,BufEnter * :silent! !

" Make # comments in python stay indented
autocmd BufRead *.py inoremap # X<c-h>#

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
" Usage:
" :cc      see the current error
" :cn      next error
" :cp      previous error
" :clist   list all errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Make vim save .un~ and .swp files in $HOME/tmp instead:
set backupdir=$HOME/tmp//
set directory=$HOME/tmp//
set undodir=$HOME/tmp//

" tags
set tags=./tags;

" ========================================================================
" Mappings ===============================================================
" ========================================================================

" Extra escape
inoremap jk <ESC>
" Paste in insert mode
inoremap <C-y> <ESC>pa
" Shortcuts to go to EOL/Beginning of line ===============================
noremap  <C-E>      $
inoremap <C-E>      <C-O>$
" Make bracketmatching with tab
nnoremap <tab> %
vnoremap <tab> %
" Make j/k move through visible lines ====================================
noremap k gk
noremap j gj
" Fix default regexhandling ==============================================
nnoremap / /\v
vnoremap / /\v
" Toggle hlsearch and paste ==============================================
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F6> :set paste!<CR>
" Exit hlsearch
nnoremap <Leader><cr> :nohlsearch<cr>
" Leaderfunctions for adding [](){}<>"" ==================================
noremap <Leader>[ a<C-o>b[<C-o>e<C-o>l]<Esc>
noremap <Leader>( a<C-o>b(<C-o>e<C-o>l)<Esc>
noremap <Leader>{ a<C-o>b{<C-o>e<C-o>l}<Esc>
noremap <Leader>< a<C-o>b<<C-o>e<C-o>l><Esc>
noremap <Leader>" a<C-o>b"<C-o>e<C-o>l"<Esc>

" Shortcuts for switching buffers and tabs ===============================
set hidden
noremap <Leader>n   :bn<CR>
noremap <Leader>p   :bp<CR>
" Last edited buffer
noremap <Leader>l   :b#<CR>
" Close buffer but don't close the window
noremap <Leader>d   :bp\|bd #<CR>
" Close window
noremap <Leader>D   <C-w>c
" Close quickfix and location list
noremap <Leader>q   :cclose<CR>:lclose<CR>
" Save
noremap <silent><Leader>w   :w<CR>

" single characters are not written to a register when deleted
noremap x "_x
" Move lines down with '-' and up with '_'
noremap - ddp
noremap _ ddkP
" replace a line
noremap <leader>r "_ddP$
" Uppercase with <c-u> - conflits with scroll up, need other shortcut
"inoremap <c-u> <esc>viwUea
"nnoremap <c-u> viwU
" Open vimrc in split, source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" * works in visual mode too
" (https://stackoverflow.com/questions/8587136/how-do-i-search-for-the-selected-text)
vnoremap * :<C-U>let old_reg=getreg('"')\|let old_regtype=getregtype('"')<CR>
    \ gvy/<C-R><C-R>=substitute(
        \ substitute(escape(@", '/\.*$^~['), '\s\+', '\\s\\+', 'g')
        \ , '\_s\+', '\\_s*', 'g')<CR><CR>
    \ gV:call setreg('"', old_reg, old_regtype)<CR>:let v:searchforward=1<CR>

" ========================================================================
" Vundle =================================================================
" ========================================================================
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
filetype off

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
" Buffer list
Plugin 'jlanzarotta/bufexplorer'
" Git stuff
Plugin 'tpope/vim-fugitive'
" vimproc
Bundle 'Shougo/vimproc.vim'
" Track the engine.
if ! has('nvim') " Ultisnips does not work in neovim
    Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    Plugin 'honza/vim-snippets'
endif
" Show git diff indicator in sidebar
Plugin 'airblade/vim-gitgutter'
" Center all text
Plugin 'junegunn/goyo.vim'
" Highligts the current paragraph
Plugin 'junegunn/limelight.vim'
" Thesaurus
Plugin 'beloglazov/vim-online-thesaurus'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" Async make  (needs vim 8 it seems)
Plugin 'neomake/neomake'
" Erlang tags
Plugin 'vim-erlang/vim-erlang-tags'
" Erlang compilation
Plugin 'vim-erlang/vim-erlang-compiler'
" Erlang skeletons
Plugin 'vim-erlang/vim-erlang-skeletons'
" Erlang omni complete (including stdlib)
Plugin 'vim-erlang/vim-erlang-omnicomplete'
" Argumentative, moving args in ,-separated lists
Plugin 'PeterRincker/vim-argumentative'
" Repeat plugin-commands with . (dot)
Plugin 'tpope/vim-repeat'
" Make vim remember where the cursor was
Plugin 'farmergreg/vim-lastplace'
" Latex
Plugin 'vim-latex/vim-latex'
" grepper :Grepper, :GrepperGit
Plugin 'mhinz/vim-grepper'
" Dependency for vim-mark
Plugin 'inkarkat/vim-ingo-library'
" mark/highlight text. Leader-m to mark. :Mark to hide, :ClearMark to remove
Plugin 'inkarkat/vim-mark'
" Highlight the word under cursor
Plugin 'dominikduda/vim_current_word'
" Language server (LSP)
Plugin 'prabirshrestha/vim-lsp'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" - - - -
" Needed again for ultisnips to work (after vundle stuff appearently)
filetype indent plugin on       " required for latex and vundle
" ========================================================================
" Bundle configs =========================================================
" ========================================================================

" Airline ================================================================
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_close_button = 0
" Show filepath instead of git branch
let g:airline_section_b = '%-0.24{getcwd()}'
let g:airline_section_c = '%t'

" Statusline
set statusline+=%#warningmsg#
set statusline+=%*

" CtrlP ==================================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1
" The below is taken from https://github.com/kien/ctrlp.vim/issues/282
" It translates space or dash to match underscore/dash/space.
let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<![-\ ]',
        \ 'expanded': '[ _-]',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.hi,*.beam

" Bufexplorer ============================================================
noremap <silent> <C-b> :call ToggleBufExplorer()<CR>
let g:bufExplorerFindActive=0        " Do not go to active window when opening
let g:bufExplorerShowTabBuffer=1        " Yes.
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

" Ultisnips ==============================================================
if ! has('nvim')
    " Trigger configuration. Do not use <tab> if you use
    " https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"
endif

" Erlang stuff ===========================================================
:set runtimepath^=$HOME/.vim/plugin/
let g:erlang_show_errors=0
let g:erlang_make_options = '--nooutdir'
let g:erlang_flymake_options = '--nooutdir'

" Currently not used
function! s:flycheck_postprocess(entry)
    if a:entry.text =~ 'Warning: '
        let a:entry.type = 'W'
        let a:entry.text = substitute(a:entry.text, 'Warning: ', '', "g")
    else
        let a:entry.type = 'E'
    endif
endfunction

" . is used for concat with $HOME
" Setting errorformat here would overwrite the correct one in the erlang plugin,
" so don't do that.
let g:neomake_erlang_enabled_makers = ['flycheck']
let g:neomake_erlang_flycheck_maker = {
    \ 'exe': $HOME . '/.vim/bundle/vim-erlang-compiler/compiler/erlang_check.erl',
    \ 'args': ['--nooutdir'],
    \ 'postprocess': function('s:flycheck_postprocess')
    \ }
let g:neomake_open_list = 2
noremap <Leader>c :Neomake<CR>

" Don't automatically compile on write
autocmd BufWritePost * Neomake

"noremap <silent> <Leader>c :ErlangEnableShowErrors :call erlang_compiler#AutoRun(expand("<abuf>")+0)<CR>
"command! -nargs=1 Silent
            "\   execute 'silent !' . <q-args>
            "\ | execute 'redraw!'
"noremap <silent> <Leader>c :make<CR> :redraw!<CR>

" Remove extra window for vim-erlang-omnicomplete, and make Leader-C-n open the
" completion.
:set cot-=preview
inoremap <Leader><C-n> <C-x><C-o>

" Nerdtree file browser ==================================================
noremap <C-s> :NERDTreeToggle<CR>

" GitGutter ==============================================================
nnoremap <F7> :GitGutterStageHunk<CR>
nnoremap <F8> :GitGutterPreviewHunk<CR>
nnoremap <F9> :GitGutterPrevHunk<CR>
nnoremap <F10> :GitGutterNextHunk<CR>
nnoremap <F12> :GitGutterUndoHunk<CR>
" Make changes show faster (4000ms is default)
set updatetime=100
" Whitespace
highlight ExtraWhitespace ctermbg=red

" ========================================================================
" Vundle END =============================================================
" ========================================================================

" Latex ==================================================================

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=gssrep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"let g:Tex_CompileRule_pdf='bibtex %:r & pdflatex -interaction=nonstopmode %:r & bibtex %:r & pdflatex -interaction=nonstopmode %:r'
"let g:Tex_CompileRule_pdf='latexmk -pdf %:r && latexmk -c %:r'

" Don't open log files automatically
let g:Tex_GotoError=0

let g:Tex_CompileRule_pdf='latexmk -pdf -outdir=out/ -auxdir=out/ %:r'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf,bib'

" Undo some latex-suite macros
let g:Imap_FreezeImap=1

" Latex END ==============================================================

" Tmux navigator =========================================================
let g:BASH_Ctrl_j = 'off'
augroup vimrc
    au!
    au VimEnter * unmap <C-j>
    " vim-latex overwrites C-j (https://stackoverflow.com/a/31502538)
    au VimEnter * nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
augroup END
" Also make the mappings work in insert mode
inoremap <silent> <C-j> <ESC>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <ESC>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <ESC>:TmuxNavigateLeft<cr>
inoremap <silent> <C-h> <ESC>:TmuxNavigateRight<cr>

" Nvim python ============================================================
let g:python_host_prog="/usr/bin/python"

" Grepper ================================================================
nnoremap <Leader>g :GrepperGit<SPACE>
" Search with motion or visual selection
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

"let g:grepper.highlight=1

" vim-mark ===============================================================
" Need to remap these to avoid collisions with <Leader>n and <Leader>r
nmap <Leader>s <Plug>MarkRegex
xmap <Leader>S <Plug>MarkRegex
nmap <Leader>C <Plug>MarkClear

" vim-current-word =======================================================
" Mark twins of word under cursor, not the actual word under cursor.
let g:vim_current_word#highlight_twins = 1
let g:vim_current_word#highlight_current_word = 0
" Delay matching (boolean)
let g:vim_current_word#highlight_delay = 500
" Highlight color
hi CurrentWordTwins ctermbg=240 guibg=#4c4d47 gui=underline


" For some strange rubbish after upgrading vim:
" https://stackoverflow.com/questions/62148994/strange-character-since-last-update-42m-in-vim"
let &t_TI = ""
let &t_TE = ""

" LSP (language server)
" https://github.com/erlang-ls/erlang_ls is needed
if executable('erlang_ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'erlang_ls',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'erlang_ls --transport stdio']},
        \ 'allowlist': ['erlang'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    "setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    let g:lsp_format_sync_timeout = 1000
endfunction
let g:lsp_diagnostics_enabled = 0 " disable diagnostics support (compiler)

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
