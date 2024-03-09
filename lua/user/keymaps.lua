local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation (both hjkl and arrow keys)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Better tab navigation (both hjkl and arrow keys)
keymap("n", "<S-h>", "gT", opts)
keymap("n", "<S-l>", "gt", opts)
keymap("n", "<S-Left>", "gT", opts)
keymap("n", "<S-Right>", "gt", opts)

-- Navigate buffers
keymap("n", "<S-Down>", ":bnext<CR>", opts)
keymap("n", "<S-Up>", ":bprevious<CR>", opts)

-- Open Lexplorer
--keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with ctrl+shift+arrows
keymap("n", "<C-S-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

--[[
-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
]]

-- Buffer Options
keymap("n", "<leader>bd", ":b#<CR>:bd#<CR>", opts) --Close buffer without closing window ('b'uffer 'd'elete)
keymap("n", "<leader>bD", ":%bd|e#|bd#<CR>", opts) --Close all buffers except the current buffer
keymap("n", "<leader>bl", ":JABSOpen<CR>", opts)   --Open buffer switcher ('b'uffer 'l'ist)

-- Toggle GUI colors - see colorscheme.lua

-- LSP options - see lsp/handlers.lua

-- Telescope options
keymap("n", "<leader>t<CR>", ":Telescope <CR>", opts)         -- ('t'elescope)
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)  -- ('f'ind_files)
keymap("n", "<leader>ts", ":Telescope live_grep<CR>", opts)   -- ('s'tring)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)     -- ('b'uffers)
keymap("n", "<leader>td", ":Telescope diagnostics<CR>", opts) -- ('d'iagnostics)
keymap("n", "<leader>th", ":Telescope keymaps<CR>", opts)     -- ('h'elp)
keymap("n", "<leader>tt", ":Telescope treesitter<CR>", opts)  -- ('t'reesitter)

-- Workspace Options
keymap("n", "<leader>wsh", ":split<CR>", opts) --Horizontal split workspace ('s'plit 'h'orizontal)
keymap("n", "<leader>wsv", ":vs<CR>", opts)    --Vertical split workspace ('s'plit 'v'ertical)
