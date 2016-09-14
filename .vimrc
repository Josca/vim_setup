" Automatic reloading of .vimrc.
autocmd! bufwritepost .vimrc source %

" Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamedplus

" Enable Ctrl+c to copy text.
vnoremap <C-c> y

" Remove highlights.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Remap leader key.
let mapleader=","

" Mouse and backspace
set mouse=a		" Hello. 
set bs=2 		" Make backspace behave like normal again?

" Activate visual mode in normal mode
nmap <S-Up> v
nmap <S-Down> v
nmap <S-Right> v
nmap <S-Left> v

" these are mapped in visual mode
vmap <S-Up> k
vmap <S-Down> j

" Tabs
map <c-b> <esc>:tabprevious<CR> 
map <c-n> <esc>:tabnew<CR>
map <c-m> <esc>:tabnext<CR>

" map <A-Left> <esc>:tabprevious<CR> 
" map <c-n> <esc>:tabnew<CR>
" map <A-Right> <esc>:tabnext<CR>
" Navigate between windows.
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


" Diff to saved
map <c-x> <esc>:DiffSaved<CR>
map <C-S-F> <esc>:Ack<space>

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Quicksave command
noremap <C-z> :update<CR>
vnoremap <C-z> <C-C>:update<CR>
inoremap <C-z> <C-O>:update<CR>

vmap <tab> >gv
vmap <s-tab> <gv

" Quick quit command
noremap <C-w> :quit<CR>    " Quit current window using Ctrl+E.
noremap <C-S-E> :qa!<CR>   " Quit all windows.

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim 'http://www.vim.org/scripts/download_script.php?src_id=13400'
set t_Co=256
color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

set completeopt=longest,menuone
" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set tabstop=4
set expandtab " Use spaces instead of tab.
set shiftwidth=4
set colorcolumn=80
highlight ColorColumn ctermbg=233

set history=700
set undolevels=700

" Press Q to wrap text 'tw'. 
vmap Q gq
nmap Q gqap

" Define :DiffSaved command to show changes from saved file version.
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

" PLUGINS
" Setup Pathogen to manage your plugins
" " mkdir -p ~/.vim/autoload ~/.vim/bundle
" " curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" " Now you can install any plugin into a .vim/bundle/plugin-name/ folder
execute pathogen#infect()

" Settings for vim-airline - status bar.
set laststatus=2
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Ctrlp 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:syntastic_python_python_exec = 'python3'
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_run_bind = "<C-S-F10>"
let g:pymode_doc_bind = "<C-S-d>"
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Show NERDTree by default.
map <C-S-G> :NERDTreeToggle<CR>         " Show/hide Nerd tree.
map <C-S-R> :NERDTreeFind<CR> 		" Reveal file in tree. 

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

" Multiple cursor shortcuts.
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-e>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
