""" import old vim config... but not really needed
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

""" === UI config ==="
set shortmess+=I        " remove splaschreen
set number              " line number
set nowrap              " no linewrap (I don't personally like this much)
set laststatus=2        " set statusline
set statusline=%f\ %m%r%h%w
set statusline+=%=
set statusline+=\%l:\%v\ %02p%%
set statusline+=\ %y[BUF\ %n][%L\ lines]
set linebreak           " keep words together when wrap is on
" set list                " show list chars
" set listchars=tab:>-    " display tabs as so
set scrolloff=3         " min number of lines to see above and below
set shiftwidth=2        " set size of tabs
set breakindent
set breakindentopt=shift:2

""" === Searching ==="
set ignorecase
set smartcase

""" === vim behavior settings === "
set autochdir           " auto change directory!


""" ==== GUI settings / Color Scheme===
colorscheme desert

""" === Key mappings ===
""" select all
noremap <C-a> ggVG    

""" next/previous buffer
nnoremap <c-n> :bn<CR>
nnoremap <c-p> :bp<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""" === scripts / autcmd ===
" set relativenumber
set number
""" there used to be a autcmd t

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

""" ==== NVIM new stuff ===
""" disable how to disable mouse popup
aunmenu PopUp.How-to\ disable\ mouse
aunmenu PopUp.-1-

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

""" :help -> :tab help
cabbrev help tab help

""" Installing Vim Plug
""" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
""" :PlugInstall to begin
if !empty(glob(data_dir . '/autoload/plug.vim'))
  call plug#begin()
    Plug 'tpope/vim-commentary'       " gcc to comment
    Plug 'tpope/vim-surround'         " s command for surround
    Plug 'tpope/vim-repeat'           " repeat with surround, etc
  call plug#end()
endif
