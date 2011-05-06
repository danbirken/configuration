set nocompatible
set hidden

set backspace=indent,eol,start

let is_bash=1

nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set autoindent

filetype plugin on
filetype indent on

source ~/.vim/autoload/php.vim
source ~/.vim/autoload/phpfolding.vim
source ~/.vim/autoload/togglebg.vim
source ~/.vim/autoload/color_helper.vim
source ~/.vim/autoload/indent_guides.vim

" Don't need backup or swap files
set nobackup
set noswapfile

" We want an undo file so undo/redos are saved in another file
set undofile

syntax on

" When searching, lowercase searches should be case insensitive and searches
" with at least one capital letter should be case sensitive
set ignorecase
set smartcase

" For whatever reason we use capital TAGS for our ctags files
set tags=./TAGS,TAGS

" Shortcut for sorting in visual mode
vmap <leader>s :sort<CR>

" Shortcut for cleaning up trailing whitespace globally
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>

" Shortcut for fixing up array formatting $key{SPACE}=>{SPACE}$value
" both globally and in visual mode
vmap <leader>s :s/\s*=>\s*/ => /g<CR>
nmap <leader>s :%s/\s*=>\s*/ => /g<CR>

vmap <leader>c :s/\n/ /g<CR>:s/\([^ ]\)  */\1 /g<CR>:s/( /(/g<CR>
vmap <leader>f :s/\([^ ]\)  */\1 /g<CR>:s/( /(/g<CR>

set columns=100

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>
vmap <up> <nop>
vmap <down> <nop>
vmap <left> <nop>
vmap <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Shortcut for splitting screen to open new window
nmap <leader>sn :vsp:<CR>:set columns=200<CR><C-W>=
" Shortcut for equalizing screen sizes
nmap <leader>s= <C-W>=
" Shortcut for switching between screens
nmap <leader>sj <C-W><C-W>

" Updating indent preferences for YAML
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2

" Use solarized color scheme
colorscheme solarized
set background=dark
