syntax on
colorscheme slate

set hlsearch
set number
set shiftwidth=4
set smartindent
set tabstop=4

set foldmethod=indent
set foldlevelstart=20

"Pmenu Settings (Popup Menu)
highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray


"" Plugins
"call plug#begin("~/.local/share/nvim/plugged")
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"call plug#end()
"
"" Settings for coc
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction
