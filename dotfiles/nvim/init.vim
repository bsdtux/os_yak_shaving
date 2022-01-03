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
                                           
"--------------------------------------------------------------------------
" Core Changes
"--------------------------------------------------------------------------
set number
syntax on

set expandtab
set shiftwidth=4
set tabstop=4

set termguicolors
set nowrap

set nobackup nowritebackup

"--------------------------------------------------------------------------
" Set Source Path and Install Vim-plug
"--------------------------------------------------------------------------
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(data_dir . '/plugins')

"--------------------------------------------------------------------------
" Core Vim Changes
"--------------------------------------------------------------------------
exec 'source' s:path . '/splits.vim'
exec 'source' s:path . '/keybindings.vim'


"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------
exec 'source' s:path . '/plugins/dracula.vim'
exec 'source' s:path . '/plugins/nerdtree.vim'
exec 'source' s:path . '/plugins/fzf.vim'
exec 'source' s:path . '/plugins/coc.vim'

"--------------------------------------------------------------------------
" Lua Scripts
"--------------------------------------------------------------------------
"exec 'luafile' s:path . '/lua/python.lua'


call plug#end()
doautocmd User PlugLoaded

