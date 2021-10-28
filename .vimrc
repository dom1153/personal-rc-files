" VIMRC FILE
" DOMINIC DANG
" LAST UPDATE MAY 9 2019

" Installing Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
      if filereadable(expand("~/.vimrc.pluginsettings"))
          source ~/.vimrc.pluginsettings
    endif
endif

" === UI config ==="
syntax on               " set syntax highlighting on of course
set wildmenu            " shows list instead of just completing
set wildmode=list:longest,full 
" set lazyredraw          " redraw only when needed
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
set encoding=utf-8      " allow unicode font

if has('mouse')
    set mouse=nv            " enable mouse in all modes (norm, ins, vis, all)
endif

" === Indent settings ===
set expandtab           " tabs = spaces
set shiftwidth=2        " size of 'indents'
set smarttab            " auto space on tab?
set softtabstop=0       " simulated tab size (when tab is pressed)
set tabstop=2           " set size of tabs
" not really sure what auto/smart do haha
set autoindent
set smartindent
" allow manual indent of # symbols
set cindent
set cinkeys-=0#
" when textwrapping on indented lines, keep their indent
if exists("&breakindent")
    set breakindent
    set breakindentopt=shift:2
endif

" === Searching ==="
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch

" === vim behavior settings === "
set autochdir           " auto change directory!
set backspace=indent,eol,start  " fix any more backspace stuff

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
  " set guioptions-=r " enable right scrollbar
  " set guioptions-=L " disable left scrollbar??
  " set cursorline    " highlight current line selected
  colorscheme desert
  " VVV This is bad since on Sx it will resize window
  " set lines=25 columns=80

  if has("gui_gtk3") || has("gui_gtk2")
    " set guifont=Inconsolata\ 12
    " set guifont=Terminus\10
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif

  " set tabs to have number then file name
  set guitablabel=(%N)\ %f
  " always show tab bar (default is 1)
  set showtabline=2

  " highlilght color settings (gui primarily) [must be set after colorscheme]
  hi CursorLine guibg=grey5
  hi Normal guibg=grey17
  hi search guibg=khaki guifg=black
  hi incsearch guibg=lightblue guifg=black gui=none
  hi Cursor gui=reverse guibg=NONE guifg=NONE
  hi visual term=bold cterm=bold ctermfg=1 gui=bold guifg=LightBlue guibg=grey30
  " turn of all beeps
  set belloff=all
  autocmd GUIEnter * winsize 80 25
else
  " note: windows terminal overrides cursor color and background
  set vb t_vb=
  hi search cterm=none ctermfg=black ctermbg=yellow
  hi incsearch cterm=none ctermfg=black ctermbg=cyan
endif

" === Key mappings ===
" select all
noremap <C-a> ggVG    

" next/previous buffer
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>

" copy/paste from clip board
" noremap <C-S-c> "+y   
" noremap <C-S-v> "+p

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
""iabbrev x y \<CR> for multiline

" === filetype recognition ===
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" assumes bash is default
autocmd BufNewFile,BufReadPost .alias* set filetype=sh

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

" :call GenerateUnicode(0x9900, 0x9fff)
function! GenerateUnicode(first, last)
  let i = a:first
  while i <= a:last
    if (i%256 == 0)
      $put ='----------------------------------------------------'
      $put ='     0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F '
      $put ='----------------------------------------------------'
    endif
    let c = printf('%04X ', i)
    for j in range(16)
      let c = c . nr2char(i) . ' '
      let i += 1
    endfor
    $put =c
  endwhile
endfunction

" autocmd FileType python set nocindent

" all type override
autocmd FileType * set expandtab          " force tab->spaces!
autocmd FileType verilog set expandtab    " force tab->spaces!
autocmd FileType html set expandtab    " force tab->spaces!

" :help -> :tab help
cabbrev help tab help

" commands
command! Sx execute "source ~/.vimrc"
command! Xx execute "tabnew ~/.vimrc"
command! RemoveTrailingWhitespace s/\s\+$//e
