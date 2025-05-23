local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
	--[[
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
	]]
	--[[
    { name = "DiagnosticSignError", text = "X" },
    { name = "DiagnosticSignWarn", text = "!" },
    { name = "DiagnosticSignHint", text = "i" },
    { name = "DiagnosticSignInfo", text = "?" },
	--]]
	[vim.diagnostic.severity.ERROR] = "X",
	[vim.diagnostic.severity.WARN] = "!",
	[vim.diagnostic.severity.INFO] = "i",
	[vim.diagnostic.severity.HINT] = "?",
  }

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      --active = signs,
	  text = signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps()
	local opts = { noremap = true, silent = true }

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end

--M.on_attach = function(client, bufnr)
--  if client.name == "tsserver" then
--    client.server_capabilities.document_formatting = false
--  end
--  lsp_keymaps(bufnr)
--  lsp_highlight_document(client)
--end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client.name == "tsserver" then
		  client.server_capabilities.document_formatting = false
		end
		lsp_keymaps()
		lsp_highlight_document(client)
	end
})

return M
