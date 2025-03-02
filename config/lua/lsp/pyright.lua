local lspc = require("lspconfig")
local null_ls = require("null-ls")

-- Setup null-ls with yapf as a formatting source
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.yapf,
	},
})

-- Setup Pyright
lspc.pyright.setup({
	on_attach = function(client, bufnr)
		-- Ensure Pyright is attached
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })         -- Ensure formatting is synchronous
			end,
		})
	end,
})
