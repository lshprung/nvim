-- list of plugins to manage
plugin_list = {
	--"nvim-lua/popup.nvim",          -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim",        -- Useful lua functions used by lots of plugins

	-- Colorschemes
	--"lunarvim/colorschemes"         -- Additional colorschemes
	"marko-cerovac/material.nvim",   -- Material color theme

	-- Buffers
	'matbme/JABS.nvim',

	-- cmp plugins
	"hrsh7th/nvim-cmp",         -- The completion plugin
	"hrsh7th/cmp-buffer",       -- Buffer completions
	"hrsh7th/cmp-path",         -- Path completions
	"hrsh7th/cmp-cmdline",      -- Cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",     -- lsp completion
	"hrsh7th/cmp-nvim-lua",     -- config completion

	-- snippets
	"L3MON4D3/LuaSnip",            -- snippet engine
	--"rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	"neovim/nvim-lspconfig",              -- enable LSP
	--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- TreeSitter
	"nvim-treesitter/nvim-treesitter", --enable treesitter

	-- Telescope
	{ "nvim-telescope/telescope.nvim", tag = '0.1.8' }
}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = plugin_list,
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
