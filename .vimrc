" =====================
" GENERAL VIM SETTINGS
" =====================

" for safety, but not necessary
filetype off
filetype plugin indent off

call plug#begin('~/.vim/bundles')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'

"Plug 'preservim/nerdtree'
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'

"Plug 'sheerun/vim-polyglot'
"Plug 'pangloss/vim-javascript'
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'maxmellon/vim-jsx-pretty'
"Plug 'leafgarland/typescript-vim'
"Plug 'peitalin/vim-jsx-typescript'
"Plug 'ap/vim-css-color'

"Plug 'itchyny/lightline.vim'

"Plug 'yardnsm/vim-import-cost'

"Plug 'morhetz/gruvbox'
"Plug 'tomasiser/vim-code-dark'
"Plug 'dracula/vim'
"Plug 'joshdick/onedark.vim'
Plug '4513ECHO/vim-colors-hatsunemiku'

"Plug 'antoinemadec/FixCursorHold.nvim'

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
set signcolumn=no
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime


set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

set shortmess+=c

set completeopt=longest,menuone

let maplocalleader = ","
let mapleader = ","

" fix backspace key
set backspace=indent,eol,start

" 8-bit color scheme
"set t_Co=256

if !has('gui_running') && has('termguicolors')
  " Use true colors (recommended)
  set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme hatsunemiku
"colorscheme gruvbox
"colorscheme codedark
"colorscheme dracula
"colorscheme onedark


let g:python_highlight_all = 1
"let g:cursorhold_updatetime = 100

" ===
" COC
" ===

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover') 
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)"

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)"


" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" ===========
" INDENTATION
" ===========

autocmd BufNewFile,BufRead *.py,*.bib,*.tex,*.c,*.h
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=120 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal smartindent |
    \ setlocal fileformat=unix

autocmd BufNewFile,BufRead *.json,*.js,*.ts,*.jsx,*.tsx,*.html,*.css,*.php
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal textwidth=120 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal smartindent |
    \ setlocal fileformat=unix


" =========
" LIGHTLINE
" =========

"let g:lightline={'colorscheme':'gruvbox'}
set laststatus=2
set noshowmode

" ========
" NERDTREE
" ========

"nnoremap <C-t> :NERDTreeToggle<CR>

"let g:NERDTreeShowHidden = 1
"let g:NERDTreeMinmalUI = 1

"let NERDTreeIgnore = ['\.swp', '__pycache__']

" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

"let g:NERDTreeLimitedSyntax = 1
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1

"let g:cssColorVimDoNotMessMyUpdatetime = 1

" =======
" FOLDING
" =======

set foldmethod=indent
"set foldcolumn=1 "defines 1 col at window left, to indicate folding  
"let javaScript_fold=1 "activate folding by JS syntax  
set foldlevelstart=99 "start file with all folds opened

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
\ set tabstop=2 |
\ set shiftwidth=2 |
\ set softtabstop=2 |
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

" ======
" PASCAL
" ======

autocmd BufNewFile,BufRead *.pas,*.pp
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |
    \ setlocal textwidth=120 |
    \ setlocal expandtab |
    \ setlocal smartindent |
    \ setlocal fileformat=unix

let pascal_fpc=1
let pascal_delphi=1
let pascal_symbol_operator=1
let pascal_no_tabs=1


au BufNewFile,BufRead *.jsonc set filetype=json
