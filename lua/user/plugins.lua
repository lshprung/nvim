-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	--use "nvim-lua/popup.nvim"          -- An implementation of the Popup API from vim in Neovim
	--use "nvim-lua/plenary.nvim"        -- Useful lua functions used by lots of plugins

	-- Colorschemes
	--use "lunarvim/colorschemes"        -- Additional colorschemes

	-- Buffers
	use 'matbme/JABS.nvim'

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- Buffer completions
	use "hrsh7th/cmp-path" -- Path completions
	use "hrsh7th/cmp-cmdline" -- Cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- lsp completion
	use "hrsh7th/cmp-nvim-lua" -- config completion

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	--use "rafamadriz/friendly-snippets" --a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	--use "williamboman/nvim-lsp-installer" -- simple to use language server installer
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"


	-- TreeSitter
	use "nvim-treesitter/nvim-treesitter" --enable treesitter

end)
