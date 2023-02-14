local gui = false -- set to true if guicolors should be on by default
vim.g.material_style = "darker"

local function colorscheme_set()
	local colorscheme = "legacy_slate"

	if gui then
		colorscheme = "material"
	end

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
	  vim.notify("colorscheme " .. colorscheme .. " not found!")
	  return
	end

	-- Set Popup menu colors
	--highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray
	vim.cmd("highlight Pmenu ctermbg=gray guibg=gray")

	-- Set Parentheses matching to Magenta so that it's actually visible
	vim.cmd("highlight MatchParen ctermbg=none ctermfg=magenta guibg=none guifg=magenta")

	-- Change some gui colors
	vim.cmd("highlight LineNr guifg=yellow3")
	vim.cmd("highlight Comment guifg=yellow")
	vim.cmd("highlight Todo guibg=blue")
end

-- keymap for toggling colorscheme
vim.keymap.set("n", "<leader>g", function()
	gui = not gui
	if gui then
		vim.cmd(":set termguicolors")
		colorscheme_set()
		vim.cmd(":TSEnable highlight")
	else
		vim.cmd(":set notermguicolors")
		colorscheme_set()
		vim.cmd(":TSDisable highlight")
	end
end)

colorscheme_set()

--local colorscheme = "legacy_slate"
--local gui_colorscheme = "material"
--
--local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--if not status_ok then
--  vim.notify("colorscheme " .. colorscheme .. " not found!")
--  return
--end
--
----local status_ok, _ = pcall(vim.cmd, "colorscheme " .. gui_colorscheme)
----if not status_ok then
----  vim.notify("colorscheme " .. gui_colorscheme .. " not found!")
----  return
----end
--
---- Set Popup menu colors
----highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray
--vim.cmd("highlight Pmenu ctermbg=gray guibg=gray")
--
---- Set Parentheses matching to Magenta so that it's actually visible
--vim.cmd("highlight MatchParen ctermbg=none ctermfg=magenta guibg=none guifg=magenta")
