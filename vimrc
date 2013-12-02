" Setup pathogen (installed as a submodule)
runtime bundle/pathogen/autoload/pathogen.vim

" Initialize pathogen
execute pathogen#infect()

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set number

" Light solarized theme
set background=light
let g:solarized_termtrans = 1
colorscheme solarized

" Font setting
set guifont=Menlo:h13

"##############################################################################
" Easier split navigation
"##############################################################################

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Remove scrollbar
set guioptions=egm

" Restore session on vim restart
:let g:session_autosave = 'yes'
:let g:session_autoload = 'yes'

" Configure tab key
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e " for all files, can get dirty especially with Markdown
autocmd BufWritePre * :%s/\n\{3,}/\r\r/e

" Make enter and shift-enter insert newlines in command mode
" But we need to make sure enter works in history mode
" http://stackoverflow.com/a/16360104/401510
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

nmap <CR> o <Esc>
nmap <A-Enter> O <Esc>

command LastMigration tabe `=system('find db/migrate | tail -n 1')`
