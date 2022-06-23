local colorscheme = "slate"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Set Popup menu colors
--highlight Pmenu ctermbg=White ctermfg=Black guibg=Gray
vim.cmd("highlight Pmenu ctermbg=gray guibg=gray")
