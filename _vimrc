execute pathogen#infect()
syntax on
filetype plugin indent on

" nocompatible switch for full Vim, no Vi
" ruler adds line,col position
" number adds inline line numbers
" showmode displays mode (visual, normal, insert)
" showcmd displays partial command
set nocompatible ruler number showmode showcmd
" tabstop: Number of spaces that a <Tab> in the file counts for
" softtabstop: Number of spaces that a <Tab> counts while editing
" shiftwidth: Number of spaces to use for reach step of (auto) indent 
" expandtab: 
set tabstop=2 
set softtabstop=2 
set shiftwidth=2 
set expandtab
set nowrap
" smartcase if search str is mixed case = case sensitivity
"						if search str all lower case = non-sensitive search
set ignorecase smartcase
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
" Resolves an issue with Vim creating temp files for diff
let $TMP="c:/tmp"

" DBext Profile
let g:dbext_default_profile_ORA = 'type=ORA:user=vberube:passwd=r1mr1mr1m:srvname=PCINF'
let g:dbext_default_profile = 'ORA'

"add nohlsearch to the refresh screen key CTRL+L
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

