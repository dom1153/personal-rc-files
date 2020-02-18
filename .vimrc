" VIMRC FILE
" DOMINIC DANG
" LAST UPDATE MAY 9 2019

" Installing Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" ======================= Vundle BEGIN ==================================="
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
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

" highlilght color settings (gui primarily)
hi CursorLine guibg=grey5
hi Normal guibg=grey17
hi search guibg=yellow guifg=grey10
hi incsearch guibg=yellow guifg=grey10 gui=none
hi cursor guifg=black
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
syntax on               " set syntax highlighting on of course
set wildmenu            " shows list instead of just completing
set wildmode=list:longest,full 
set lazyredraw          " redraw only when needed
set shortmess+=I        " remove splaschreen
set number              " line number
set nowrap              " no linewrap (I don't personally like this much)
set laststatus=2        " set statusline
set statusline=%f\ %m%r%h%w
set statusline+=%=
set statusline+=\%l:\%v\ %02p%%
set statusline+=\ %y[BUF\ %n][%L\ lines]
set autowrite           " autowrite file before running command
set linebreak           " keep words together when wrap is on
set list                " show list chars
set listchars=tab:>-    " display tabs as so
set scrolloff=3         " min number of lines to see above and below

if has('mouse')
    set mouse=nv            " enable mouse in all modes (norm, ins, vis, all)
endif

" === Indent settings ===
set expandtab           " tabs = spaces
set shiftwidth=2        " size of 'indents'
set smarttab            " auto space on tab?
set softtabstop=0       " simulated tab size (when tab is pressed)
set tabstop=2           " set size of tabs

" === vim behavior settings === "
set autochdir           " auto change directory!
set backspace=indent,eol,start  " fix any more backspace stuff

" === Searching ==="
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" === swap/backup/ undo files ===

if has("&undodir")
  if isdirectory(expand("~/.vim/.undo/"))
    set undodir=~/.vim/.undo/
  else
    silent ! mkdir -p ~/.vim/.undo
  endif
endif
if isdirectory(expand("~/.vim/.backup/"))
  set backupdir=~/.vim/.backup/
else
  silent ! mkdir -p ~/.vim/.backup
endif
if isdirectory(expand("~/.vim/.swp//"))
  set directory=~/.vim/.swp/
else
  silent ! mkdir -p ~/.vim/.swp
endif

" ==== GUI settings / Color Scheme===
if has("gui_running") 
  set guioptions-=T
  set guioptions-=r " enable right scrollbar
  set guioptions-=L " disable left scrollbar??
  "set cursorline    " highlight current line selected
  colorscheme desert
  " turn of all beeps
  set belloff=all
else
  set vb t_vb=
endif

" === Key mappings ===
" select all
noremap <C-a> ggVG    

" next/previous buffer
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>

" copy/paste from clip board
noremap <C-S-c> "+y   
noremap <C-S-v> "+p

" remove highlight with ,\ hotkey
" nmap <silent> ,/ :nohlsearch<CR>

" === scripts/autocmd ===
if v:version >= 800 || (has("&relativenumber"))
  set relativenumber      " relative number (combined with number in 7.4 is a hybrid mode)
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
endif

" === abbreviations/macro (see :ab) ===
" you can precursor with autcmd FileType as well
"iabbrev addcsh #!/bin/csh -f
"iabbrev adddebug -diag +generatec -cflg -g -asmflg -g -zoix=debug

" === filetype recognition ===
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Don't allow editing of read only files
autocmd BufRead * let &modifiable = !&readonly

" === Plugin Settings ===
" === tpope comment
autocmd FileType csh setlocal commentstring=#\ %s
autocmd FileType tcsh setlocal commentstring=#\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType conf setlocal commentstring=#\ %s
autocmd FileType python setlocal commentstring=#\ %s
" // comments
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType verilog setlocal commentstring=//\ %s
autocmd FileType systemverilog setlocal commentstring=//\ %s
" vim comments
autocmd FileType vim setlocal commentstring=\"\ %s

" netrw is the default file explorer (plugin). toggle with i in explorer. 
" 3 = tree view
let g:netrw_liststyle = 3
let g:netrw_banner = 0
