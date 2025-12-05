local gui = true -- set to true if guicolors should be on by default

local function colorscheme_set(set_gui_colors)

	local colorscheme

	if set_gui_colors then
		vim.cmd(":set termguicolors")
		colorscheme = "slate"
	else
		vim.cmd(":set notermguicolors")
		colorscheme = "sorbet"
	end

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
	  vim.notify("colorscheme " .. colorscheme .. " not found!")
	  return
	end

	if set_gui_colors then
		if vim.fn.exists(':TSEnable') > 0 then
			vim.cmd(":TSEnable highlight")
		end
	else
		if vim.fn.exists(':TSDisable') > 0 then
			vim.cmd(":TSDisable highlight")
		end
	end

	---- Set Popup menu colors
	--if not (vim.fn.has("nvim-0.10") == 1) then
	--	--highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray
	--	vim.cmd("highlight Pmenu ctermbg=gray guibg=gray")

	--	-- Set Parentheses matching to Magenta so that it's actually visible
	--	vim.cmd("highlight MatchParen ctermbg=none ctermfg=magenta guibg=none guifg=magenta")
	--end

	-- TODO fix TODO highlight
	-- TODO fix FIXME highlight

	-- Change some gui colors
	vim.cmd("highlight LineNr ctermfg=lightyellow")
	vim.cmd("highlight LineNr guifg=yellow3")
	vim.cmd("highlight Comment guifg=yellow3")
	vim.cmd("highlight Todo guibg=blue")
	vim.cmd("highlight MatchParen guibg=none guifg=magenta")
end

-- keymap for toggling colorscheme
vim.keymap.set("n", "<leader>g", function()
	gui = not gui
	colorscheme_set(gui)
end)

colorscheme_set(gui)

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
