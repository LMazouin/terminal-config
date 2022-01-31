" =====================
" GENERAL VIM SETTINGS
" =====================

" for safety, but not necessary
filetype off
filetype plugin indent off

call plug#begin('~/.vim/bundles')

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tomasiser/vim-code-dark'
" Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'ap/vim-css-color'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'

call plug#end()

" for plugins to work
filetype plugin indent on
syntax on

" general vim settings
set encoding=utf-8
set number
set ruler
set hlsearch
set splitbelow
set splitright
set cmdheight=1
set signcolumn=yes
" set completeopt=noinsert,menuone,noselect
let maplocalleader = "//"
let mapleader = "//"

" fix backspace key
set backspace=indent,eol,start

" 8-bit color scheme
set t_Co=256
colorscheme codedark
" colorscheme gruvbox


let g:python_highlight_all = 1


nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" ===========
" INDENTATION
" ===========

autocmd BufNewFile,BufRead *.html,*.css,*.php
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=200 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal smartindent |
    \ setlocal fileformat=unix

autocmd BufNewFile,BufRead *.js,*.json,*.jsx,*.py,*.twig,*.bib,*.tex
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=120 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal smartindent |
    \ setlocal fileformat=unix


" =========
" POWERLINE
" =========

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set rtp+=/User/lmazouin/Library/Python/3.9/lib/python/site–packages/powerline/bindings/vim
set laststatus=2
set noshowmode

" ========
" NERDTREE
" ========

nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinmalUI = 1
let g:NERDTreeStatusLine = ''

let NERDTreeIgnore = ['\.swp', '__pycache__']

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 0

let g:cssColorVimDoNotMessMyUpdatetime = 1

" =======
" FORTRAN
" =======

au BufNewFile,BufRead *.f
\ set expandtab |
\ set tabstop=6 |
\ set shiftwidth=6 |
\ set softtabstop=6 |
\ set smartindent |
\ set textwidth=72 |
\ set fileformat=unix

" indentation fortran90/95
au BufNewFile,BufRead *.f90
\ set expandtab |
\ set tabstop=4 |
\ set shiftwidth=4 |
\ set softtabstop=4 |
\ set smartindent |
\ set textwidth=72 |
\ set fileformat=unix

" for better fortran77 syntax highlighting
if has('syntax') && (&t_Co > 2)
  syntax enable
endif

let s:extfname = expand("%:e")
if s:extfname ==? "f90" || s:extfname ==? "f95"
	let fortran_do_enddo=1
	"let fortran_more_precise=1
	let fortran_have_tabs=1
  	let fortran_free_source=1
  	unlet! fortran_fixed_source
else
  	filetype indent off
	let fortran_fixed_source=1
  	unlet! fortran_free_source
endif

au BufNewFile,BufRead *.html set filetype=htmldjango
