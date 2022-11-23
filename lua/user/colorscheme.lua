local colorscheme = "legacy_slate"

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
