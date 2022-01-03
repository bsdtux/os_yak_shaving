"           _____                    _____          
"          /\    \                  /\    \         
"         /::\    \                /::\    \        
"         \:::\    \              /::::\    \       
"          \:::\    \            /::::::\    \      
"           \:::\    \          /:::/\:::\    \     
"            \:::\    \        /:::/__\:::\    \    
"            /::::\    \       \:::\   \:::\    \   
"   _____   /::::::\    \    ___\:::\   \:::\    \  
"  /\    \ /:::/\:::\    \  /\   \:::\   \:::\    \ 
" /::\    /:::/  \:::\____\/::\   \:::\   \:::\____\
" \:::\  /:::/    \::/    /\:::\   \:::\   \::/    /
"  \:::\/:::/    / \/____/  \:::\   \:::\   \/____/ 
"   \::::::/    /            \:::\   \:::\    \     
"    \::::/    /              \:::\   \:::\____\   
"     \::/    /                \:::\  /:::/    /    
"      \/____/                  \:::\/:::/    /     
"                                \::::::/    /      
"                                 \::::/    /       
"                                  \::/    /        
"                                   \/____/         
                                           

set number
syntax on

set expandtab
set shiftwidth=4
set tabstop=4

set termguicolors
set nowrap

set nobackup nowritebackup

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

" Feature Files
exec 'source' s:path . '/splits.vim'

" Plugins
exec 'source' s:path . '/plugins/dracula.vim'
exec 'source' s:path . '/plugins/nerdtree.vim'
exec 'source' s:path . '/plugins/fzf.vim'

call plug#end()
doautocmd User PlugLoaded

