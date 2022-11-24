-- Misc. Settings
vim.syntax          = true        --turn on syntax highlighting
vim.opt.hlsearch    = true        --highlight search matches
vim.opt.number      = true        --number rows
vim.opt.shiftwidth  = 4           --set shiftwidth
vim.opt.smartindent = true        --auto-indent
vim.opt.tabstop     = 4           --set tab length
vim.cmd("autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o") --disable automatic comment insertion
vim.opt.mouse       = ""          --disable mouse

-- Fold Settings
vim.opt.foldmethod     = "indent" --enable fold detection
vim.opt.foldlevelstart = 20       --set initial fold

-- Additional Settings from Video Series
-- :help options
-- Autocomplete Settings
vim.opt.completeopt = { "menuone", "noselect" } -- show menu even if only one entry; do not auto-select from menu
vim.opt.signcolumn  = "yes"                     -- always show the sign column, otherwise it would shift the text each time
vim.opt.shortmess:append "c"                    -- for autocompletion, don't give standard messages
-- Misc. Settings
vim.opt.conceallevel  = 0         -- do not conceal text
vim.opt.fileencoding  = "utf-8"   -- the encoding written to a file
--vim.opt.pumheight     = 10        -- pop up menu height
--vim.opt.termguicolors = true      -- set term gui colors (most terminals support this)
