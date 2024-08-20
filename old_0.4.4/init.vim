syntax on
try
	colorscheme sorbet 
catch
	colorscheme slate
endtry

set hlsearch
set number
set shiftwidth=4
set smartindent
set tabstop=4

set foldmethod=indent
set foldlevelstart=20

"Pmenu Settings (Popup Menu)
highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray

"-- Custom keybinds --

"Remap space as leader key
noremap <Space> <Nop>
let mapleader = " "
let maplocalleader = " "

"-- Normal --
"Better window navigation (both hjkl and arrow keys)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
"Better tab navigation (both hjkl and arrow keys)
nnoremap <S-h> gt
nnoremap <S-l> gt
nnoremap <S-Left> gT
nnoremap <S-Right> gt
"Navigate buffers
nnoremap <S-Down> :bnext<CR>
nnoremap <S-Up> :bprevious<CR>
"Resize with ctrl+shift+arrows
nnoremap <C-S-Up> :resize -2<CR>
nnoremap <C-S-Down> :resize +2<CR>"
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

"Buffer Options
"Close buffer without closing window ('b'uffer 'd'elete)
nnoremap <leader>bd :b#<CR>:bd#<CR> 

"Workspace Options
"Horizontal split workspace ('s'plit 'h'orizontal)
nnoremap <leader>wsh :split<CR>
"Vertical split workspace ('s'plit 'v'ertical)
nnoremap <leader>wsv :vs<CR>
