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
Plug 'evanleck/vim-svelte'
Plug 'jxnblk/vim-mdx-js'
Plug 'airblade/vim-gitgutter'
Plug 'hashivim/vim-terraform'
Plug 'leafgarland/typescript-vim'
Plug 'editorconfig/editorconfig-vim'
" This plugin causes syntax highlighting issues in JS that uses
" template strings and regular expressions.
Plug 'Quramy/vim-js-pretty-template'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Themes
Plug 'jacoborus/tender.vim'
Plug 'mhartington/oceanic-next'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" Basics
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
set autoread
set hidden

" Don't put swap files and such in the working dir
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Color theme
set termguicolors
set background=dark
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Gnarly hack to make fold colors more to my preference (i.e., subtle)
hi Folded guibg=#172730
hi Folded guifg=#384855

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF
nnoremap <C-p> :<C-u>GitFiles<CR>
nnoremap <C-o> :<C-u>Files<CR>
nnoremap <C-S-o> :<C-u>Rg<CR>
nnoremap <C-i> :<C-u>bnext<CR>
nnoremap <C-u> :<C-u>bprevious<CR>

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
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'handlebars': ['prettier'],
\}

" Rust formatting
let g:rustfmt_autosave = 1

" CoC Config + Language Servers
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
\   'coc-ember',
\   'coc-go',
\   'coc-tsserver'
\]

" JS Pretty Template
call jspretmpl#register_tag('hbs', 'handlebars')

autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl
autocmd FileType typescript JsPreTmpl

" compat with leafgarland/typescript-vim
autocmd FileType typescript syn clear foldBraces

set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=50
