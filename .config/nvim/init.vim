" --- VIM COMPATIBLE SETTINGS ---
set hlsearch
set incsearch
set backspace=indent,eol,start
set ruler
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

" --- DEFAULT THEME CHANGES ---
if (has("termguicolors"))
	set termguicolors
endif
highlight IncSearch guifg=#ff5f87 guibg=purple
highlight Search guifg=purple guibg=#ff5f87
highlight Visual guibg=darkblue guifg=cyan
highlight NonText guifg=#444454
highlight Pmenu guibg=black

" --- NEOVIM ONLY SETTINGS ---
" loads lua scripts only if :lua command exists (i.e. neovim)
if exists(':lua')
    lua require('neovim_config')
    colo base16-chalk
    " let g:tokyonight_style = "night"
    " let g:tokyonight_transparent = 1
    " colo tokyonight
    " colo monokai
    " colo gruvbox
    highlight Normal ctermbg=NONE guibg=NONE
    " highlight Comment ctermbg=238 guibg=238
    " highlight Visual guibg=darkblue guifg=cyan
    echo 'loaded Neovim additional configs'
end
