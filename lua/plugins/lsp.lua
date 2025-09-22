return { 
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- set signs for diagnostics
		local signs = {
			Error = "X ",
			Warn = "! ",
			Hint = "? ",
			Info = "i "
		}
		vim.diagnostic.config({
			signs = {
				text = signs,
			},
		})

		-- Diagnostic config
		local config = {
			-- disable virtual text
			virtual_text = false,
			-- show signs
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

		-- keymaps
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
		--vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
		--vim.keymap.set("n", "<leader>ld", vim.lsp.buf.type_definition, opts)
		--vim.keymap.set("n", "<leader>ls", require("telescope.builtin").lsp_document_symbols, opts)

		-- Create a command `:Format` local to the LSP buffer
		--vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		--	vim.lsp.buf.format()
		--end, { desc = "Format current buffer with LSP" })

		--lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")
	end
}
