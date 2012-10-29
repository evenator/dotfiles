set nocompatible

" go
set rtp+=$GOROOT/misc/vim

" closetag for html, xml only
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
au BufRead,BufNewFile *.jinja2 setfiletype html

syn sync minlines=8000 " Fix broken Python syntax highlighting for files with long docstrings at the top

" easy line wrap in normal mode with gqap
set textwidth=79
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
" match OverLength /\%80v.\+/
if exists('+colorcolumn')
    set colorcolumn=80
"else
"    au BufWinEnter *.py let w:m1=matchadd('Search', '\%<80v.\%>80v', -1)
"    au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
endif

if exists('+rnu')
    " use Ctrl+L to toggle the line number counting method
    function! g:ToggleNuMode()
        if(&rnu == 1)
            set nu
        else
            set rnu
        endif
    endfunc
    nnoremap <leader>r :call g:ToggleNuMode()<cr>
endif

" Cursor settings

set scrolloff=7 " How many lines to keep above or below the cursor.
set cursorline  " Highlight the current line.

" iTerm2 - change cursor shape in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Autocomplete settings

set wildmenu " Use wildmenu when tab completing.
set wildmode=list:longest

set complete-=i " Tab completion should be fast.

" Command/status/ruler settings

set ruler " Show a pretty ruler.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

set cmdheight=2 " Give more space for the command line.

set laststatus=2 " Use a pretty status line.
set statusline=%2n:*%-32.32f%*\ \ %2*%r%m%*\ %=%y\ %15(%l/%L:%c\ (%2p%%)%)

set showcmd " Show how big the visual selection is.

set shortmess=atI " Remove some hit enter prompts.

" Miscellaneous settings

set linebreak " Break lines at spaces rather than anywhere.
set wrap " Allow lines to wrap.

set autoread " Autoread files which have been changed on disk.

set hidden " Allow hidden files.

set backspace=eol,start,indent " Allow backspace to work over many things.
set whichwrap+=<,>,h,l " Allow moving to the next line with left and right keys.

set modelines=0 " read somewhere that this disables certain security exploits

" History settings

set history=10000 " Have a very long history.
set undofile      " Persist undo history across file loads

" Search settings
"
set ignorecase 
set smartcase
set gdefault " s/foo/bar/ replaces all
set hlsearch
set incsearch
" use real regexes instead of vim ones
nnoremap / /\v
vnoremap / /\v
" easily clear search
nnoremap <leader><space> :noh<cr>

" Indent settings
"
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
filetype plugin indent on

" Match parens
"
set showmatch
set mat=2

" Visual bell
"
set noerrorbells
set novisualbell
set t_vb=

" Colors and fonts
"
syntax enable

set nuw=5 " Set a wide number width.

set background=dark " Use a dark colorscheme.

if has("gui_running")
    set t_Co=256 " Use all the colors.
    set guioptions-=T " Remove GUI toolbar.
    set mousehide " Hide the mouse.
    set nu " Turn on line numbers.
    colorscheme solarized
else
    set nonu " Turn off line numbers.
    colorscheme solarized
    set mouse=a
endif
    
" Always try and be in UTF-8
set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac " Prefered line endings.

set nobackup " Turn off backup files.
set nowritebackup " Turn off backups before writes.

" Key remappings

"  STAY ON THE LEADER
let mapleader = ","

"  Easier split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"  toggle hidden characters
nmap <leader>l :set list!<CR>
"  un-highlight search
nmap <leader>s :let @/ = ""<CR>
"  md/rst-h1 current line
nnoremap <leader>1 yypVr=
"  md/rst-h2 current line
nnoremap <leader>2 yypVr-
"  rst-h3 current line
nnoremap <leader>3 yypVr^

"  DIE HELP DIEDIEDIE
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"  tab moves between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"  rewrap paragraph with \q
nnoremap <leader>q gqap

" Indent comments
inoremap # X#

" Python settings.
let python_highlight_all = 1


" vim-latex settings
set grepprg=grep\ -nh\ $*
let g:text_flavor='latex'
