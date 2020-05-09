call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'Quramy/vim-js-pretty-template'

" Themes
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

set number
set tabstop=2
set shiftwidth=2
filetype plugin indent on
set expandtab
set hlsearch
set laststatus=2
set noerrorbells
set nostartofline
set ruler
set showmode
set title

" Color theme
set termguicolors
set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF
nnoremap <C-p> :<C-u>GitFiles<CR>
nnoremap <C-o> :<C-u>Files<CR>

" Pane management
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Whitespace management
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

" Linting + Prettier
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}

" CoC Config + Language Servers
set updatetime=300
set shortmess+=c
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
\   'coc-ember',
\   'coc-go'
\]

" JS Pretty Template
call jspretmpl#register_tag('hbs', 'handlebars')

autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
autocmd FileType typescript JsPreTmpl
