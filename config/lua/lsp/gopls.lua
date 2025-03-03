local lspc = require("lspconfig")
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.gofmt,
	},
})

lspc.gopls.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
})
