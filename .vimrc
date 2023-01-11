" ---HELP---
" How to install:
" https://itisgood.ru/2021/01/19/kak-ustanovit-poslednjuju-versiju-redaktora-vim-v-sistemah-linu/

" ---VIM-PLUGINS---
call plug#begin('~/.vim/plugged')

" ---NAVIGATION--
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'

" ---COMPLETION---
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'chiel92/vim-autoformat'

" ---SEARCH---
Plug 'kien/ctrlp.vim'
Plug 'nelstrom/vim-visual-star-search'
" Plug 'pechorin/any-jump.vim'
" Plug 'craigemery/vim-autotag'

" ---VISUAL---
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---TOOLS---
Plug 'skanehira/translate.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'

" ---OTHER---
Plug 'philrunninger/nerdtree-visual-selection'
Plug 'mhinz/vim-startify'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'konfekt/vim-select-replace'

call plug#end()

" ---VIM-SETTINGS---

" BASIC settings:
set number
set modifiable

set clipboard+=unnamedplus

filetype on
filetype plugin on
filetype plugin indent on

" TABS settings:
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" Text indentation:
set autoindent
set shiftround
set breakindent

" Buffer settings:
set hidden
set ffs=unix,dos,mac
set emoji

" Files settings:
set autoread
set noautochdir

" Files backups:
set fsync
set noswapfile
set noundofile
set writebackup
set nobackup

" Mouse settings:
set mouse=n

" Encoding settings:
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,koi8r,cp1251,cp866,ucs-2le

" Vi back-compatible:
set nocompatible

" No beep!
set noerrorbells
set novisualbell
set t_vb=
set belloff=all

" Appearance of the editor:
syntax on
set cursorline
set foldcolumn=0

" This code fixes gruvbox theme spell-checking highlighting:
let g:gruvbox_guisp_fallback = "bg"

" Some cool colorschemes: gruvbox, 256_noir
colorscheme gruvbox
set background=dark

" Search settings:
set hlsearch
set incsearch

set ignorecase
set smartcase

set iminsert=0
set imsearch=0

" Vim spell-checking settings:
set spelllang=en,ru

" How vim splits window:
set splitright
set splitbelow

" Vim terminal settings:
set shell=fish

" ---VIM-SHORTCUTS---

" Fast 'jj' -> ESC
imap jj <Esc>

" Disables arrows:
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Fast and simple copy to system buffer:
vnoremap <silent> <C-C> "+y

" Clears last search results highlighting:
nnoremap <silent> <F1> :noh<CR>

" tagbar class-tree viewer plugin shortcuts:
nnoremap <silent> <F2> :TagbarToggle<CR>

" vim-autoformat plugin shortcuts:
noremap <silent> <F3> :Autoformat<CR>

" Spell checking shortcuts:
nnoremap <silent> <F4> :set spell!<CR>

" Ctags program shortcuts:
nnoremap <silent> <F5> :AsyncRun ctags -R<CR>

" DoxygenToolkit.vim plugin shortcuts:
nnoremap <silent> <F9> :Dox<CR>

" NERDTree plugin shortcuts:
noremap <silent> <C-n> :NERDTreeToggle<CR> :NERDTreeRefreshRoot<CR>

" translate.vim plugin shortcuts:
vmap t <Plug>(VTranslate)

" Windows jumping shortcuts:
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

map <silent> <C-Left>  :call WinCreate('h')<CR>
map <silent> <C-Down>  :call WinCreate('j')<CR>
map <silent> <C-Up>    :call WinCreate('k')<CR>
map <silent> <C-Right> :call WinCreate('l')<CR>

function! WinMove(key)
    exec "wincmd ".a:key
endfunction

function! WinCreate(key)
    if (match(a:key, '[jk]'))
        wincmd v
    else
        wincmd s
    endif
    exec "wincmd ".a:key
endfunction

" ---VIM-PLUGINS-SETTINGS---

" Airline plugin settings:
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'unicode'

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ':'
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#keymap#enabled = 0

let g:airline_section_c = '%t'
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_linecolumn_prefix = '¶ '
let g:airline_fugitive_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'

" NERDTree plugin settings:
let NERDTreeShowHidden = 1

" NetRW plugin settings:
let g:netrw_banner = 0

" let g:loaded_netrw       = 1
" let g:loaded_netrwPlugin = 1

" translate.vim plugin settings:
let g:translate_source = "en"
let g:translate_target = "ru"
let g:translate_popup_window = 1 " If you want use popup window, set value 1.
let g:translate_winsize = 10 " Set buffer window height size if you doesn't use popup window.

" vim-autoformat plugin settings:
let g:formatdef_my_cpp = '"astyle --mode=c --style=bsd -O -k1 -W1 -p -xg -c -H -Y -S -N -xG -xl".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_cpp = ['my_cpp']

let g:formatdef_my_c = '"astyle --mode=c --style=bsd -p -xg -c -H -Y -S -k3".(&expandtab ? "s".shiftwidth() : "t")'
let g:formatters_c = ['my_c']

" DoxygenToolkit.vim plugin settings:
let g:DoxygenToolkit_authorName = "Roman Bondarenko"

" tagbar plugin settings:
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" vim-airline-themes plugin settings:
let g:airline_theme = 'dark_minimal' " Some other cool themes: base16

" ---AUTOCMD-SETTINGS---

" This command kills Caps-Lock key:
autocmd! VimEnter AsyncRun setxkbmap -option 'ctrl:nocaps'
