" VIMRC FILE
" DOMINIC DANG
" LAST UPDATE MAY 9 2019

" Installing Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" ======================= Vundle BEGIN ==================================="
if filereadable("~/.vim/bundle/Vundle.vim")
  set nocompatible              " be iMproved, required
  filetype off                  " required

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'connorholyday/vim-snazzy'   " colorscheme.
  Plugin 'tpope/vim-commentary'       " comment stuff via 'gcc'
  Plugin 'tpope/vim-surround'         " surround
  Plugin 'tpope/vim-repeat'           " repeat more (surround)

  call vundle#end()
  filetype plugin indent on           " required
endif
" ======================= Vundle END ====================================="

syntax on     " set syntax highlighting on of course

" highlilght color settings (gui primarily)
hi CursorLine guibg=grey5
hi Normal guibg=grey17
hi search guibg=yellow guifg=grey10
hi incsearch guibg=yellow guifg=grey10 gui=none
hi cursor guifg=black
" hi visual term=reverse
hi visual term=bold cterm=bold ctermfg=1 gui=bold guifg=LightBlue guibg=grey30

" === indenting modes ===
set autoindent
set smartindent
" vim version 8 or patched 7.4
" when textwrapping on indented lines, keep their indent
if exists("&breakindent")
    set breakindent
    set breakindentopt=shift:2
endif

" === UI config ==="
set autowrite           " save any changes before taking actions (like make)
set cmdheight=2         " set bottom bar height vim (defualt=1)
set cursorline          " highlight current line selected
set laststatus=2        " always have lastwindow with status line (2 = always keep)
set linebreak           " keep words together when wrap is on
set nowrap              " no linewrap (I don't personally like this much)
set number              " line number
"set relativenumber      " relative number (combined with number in 7.4 is a hybrid mode)
set ruler               " show line number and status bar info
set scrolloff=3         " minimum lines to see above and below
set shortmess+=I        " remove splaschreen
set showcmd             " shows last command. visual mode has more info
set showmode            " tells you when in non-normal mode
set wildmenu            " shows list instead of just completing
set wildmode=list:longest,full
set foldlevel=0         " always have everything folded
"set paste               " proper paste marks from outside sources (middle mouse)
set statusline=%f\ %m%r%h%w
set statusline+=%=
set statusline+=\%l:\%v\ %02p%%
set statusline+=\ %y[BUF\ %n][%L\ lines]
set list                " for showing whitespace chars
set listchars=tab:>-    " show tabs as so

" === Indent settings ===
set expandtab           " tabs = spaces
set shiftwidth=2        " size of 'indents'
set smarttab            " auto space on tab?
set softtabstop=0       " simulated tab size (when tab is pressed)
set tabstop=2           " set size of tabs

" === vim behavior settings === "
set autochdir           " auto change directory!
set backspace=indent,eol,start  " fix any more backspace stuff
"set confirm             " set vim to ask what to do with unsaved files
"set hidden              " preserve buffers, very useful

" === Searching ==="
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" === swap/backup/ undo files ===
silent !mkdir -p ~/.vim/.undo > /dev/null 2>&1
silent !mkdir -p ~/.vim/.backup > /dev/null 2>&1
silent !mkdir -p ~/.vim/.swp > /dev/null 2>&1
if has("&undodir")
    set undodir=~/.vim/.undo//
endif
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" ==== GUI settings / Color Scheme===
if has("gui_running") 
  set guioptions-=T
  set guioptions-=r " enable right scrollbar
  set guioptions-=L " disable left scrollbar??
  colorscheme desert
  " turn of all beeps
  set belloff=all
else
  set vb t_vb=
  let g:solarized_termcolors=256
  set background=dark
  silent! colorscheme solarized
endif

" === Key mappings ===
" exit with ctrl-x
noremap <C-x> :q<Enter>
" save with ctrl-s
noremap <C-s> :w<Enter>
" select all
noremap <C-a> ggVG    

" === Clipboard shortcuts ===
" copy/paste from clip board
noremap <C-S-c> "+y   
noremap <C-S-v> "+p

" === unmap (normal mode) arrow keys ===
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
noremap <C-up> <nop>
noremap <C-down> <nop>
noremap <C-left> <nop>
noremap <C-right> <nop>

" remove highlight with ,\ hotkey
nmap <silent> ,/ :nohlsearch<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>  " edit vimrc using using \ev
nmap <silent> <leader>sv :so $MYVIMRC<CR> " reload vimrc using \sv

" navigate windwos
map <LEFT> <C-W>h
map <RIGHT> <C-W>l
map <UP> <C-W>k
map <DOWN> <C-W>j

" navigate tabs
map <C-LEFT> :tabprev<CR>
map <C-RIGHT> :tabnext<CR>

" === scripts/autocmd ===
if v:version >= 800 || (has("&relativenumber"))
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END

  " make it easier to read when set wrap is on
  if exists("&breakindent")
      set breakindent
      set breakindentopt=shift:2
  endif
endif

" === filetype recognition ===
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Don't allow editing of read only files
autocmd BufRead * let &modifiable = !&readonly

" === Plugin Settings ===
"autocmd FileType apache setlocal commentstring=#\ %s
autocmd FileType csh setlocal commentstring=#\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s

" abbreviations/macro (see :ab)
"iabbrev addcsh #!/bin/csh -f
"iabbrev adddebug -diag +generatec -cflg -g -asmflg -g -zoix=debug
