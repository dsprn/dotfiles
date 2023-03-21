" --- VIM COMPATIBLE SETTINGS ---
set hlsearch
set incsearch
set backspace=indent,eol,start
set ruler
" set number
" detects if a file has been changed outside of vim and reloads it
set autoread
set mouse=a
set keywordprg=:help
set guicursor=i:ver100-iCursor 	" cursor settings (change to icursor when in insert mode)
" enables syntax, indentation and netrw plugin
syntax on
" finding files
" search down into subfolders
" provides tab-completion for all file-related tasks
set path+=**
" display all matching files when we tab complete
set wildmenu
" paren settings
" show the matching parenthesis when typing the closing one
set showmatch
" time spent highlighting the matching paren
set matchtime=3
" split settings
" vertical split to the right
set splitright
" horizontally split to the bottom
set splitbelow
" backup settings
set backup
set backupdir=~/.config/nvim/backups//
" swap files
set swapfile
set directory=~/.config/nvim/swapfiles//
" persistent undos
set undofile
set undodir=~/.config/nvim/undos//
set undolevels=1000
set tabstop=4

" --- AUTOCOMMANDS ---
" always open the help buffer in a vertical split to the right
" open it to the left by using wincmd H (instead of wincmd L)
autocmd! FileType help :wincmd H | :vert

" --- BINDINGS ---
nnoremap / /\c
nnoremap ? ?\c
vnoremap / /\c
vnoremap ? ?\c
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=" "
set timeout
set timeoutlen=3000 
set ttimeoutlen=100
tnoremap <Esc> <C-\><C-n>
nnoremap <Esc> :noh<CR>/<BS>
nnoremap <M-;> :CommentToggle<CR>
vnoremap <M-;> :'<,'>CommentToggle<CR>
nnoremap <A-Right> 15<C-W><
nnoremap <A-Left> 15<C-W>>
nnoremap <A-Up> 15<C-W>+
nnoremap <A-Down> 15<C-W>-

" copy/paste to different buffer
vmap <C-c> :w! ~/.config/nvim/.vimbuffer<CR>
" nmap <C-c> :.w! ~/.config/nvim/.vimbuffer<CR>
map <C-p> :r ~/.config/nvim/.vimbuffer<CR>

" --- DEFAULT THEME CHANGES ---
if (has("termguicolors"))
	set termguicolors
endif
highlight IncSearch guifg=#ff5f87 guibg=purple
highlight Search guifg=purple guibg=#ff5f87
highlight Visual guibg=darkblue guifg=#a1bded
highlight NonText guifg=#444454
highlight Pmenu guibg=black

" --- NEOVIM ONLY SETTINGS ---
" loads lua scripts only if :lua command exists (i.e. neovim)
if exists(':lua')
    lua require('neovim_config')
    colo base16-chalk
    " colo base16-grayscale-dark
    " highlight Comment ctermbg=238 guibg=238

	" semantic highlights
	" colo zenbones
	" highlight @variable guifg=#ab9cff
	" highlight @field guifg=#f57a7a
	highlight Normal ctermbg=NONE guibg=NONE guifg=white
	highlight Visual guibg=darkblue guifg=cyan

	" clojure specific semantic highlights
	" highlight @type.clojure guifg=#f57a7a

	" bash specific semantic highlights
	" highlight @parameter.bash guifg=#63d47d

    echo 'loaded Neovim additional configs'
end
