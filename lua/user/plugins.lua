-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	--use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
	--use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
	
	-- Colorschemes
	--use "lunarvim/colorschemes"  -- Additional colorschemes
end)
