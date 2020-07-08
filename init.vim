call plug#begin("~/.vim/plugged")

" PLUGIN SECTION

" THEME
Plug 'dracula/vim'

" FILE EXPLORER
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

" SEARCH
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" INTELLISENSE and SYNTAX HIGHLIGHT
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-rls', 'coc-phpls', 'coc-java', 'coc-flutter', 'coc-ember', 'coc-sql', 'coc-tailwindcss', 'coc-yaml', 'coc-clangd'] 



call plug#end()

" CONFIG SECTION
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

" for FILE EXPLORER
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" for INTEGRATED TERMINAL
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" for switching between panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" for SEARCH
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" ignore node_modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <A-m> :!cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1<CR>
nnoremap <Space> :CocCommand clangd.switchSourceHeader<CR>



