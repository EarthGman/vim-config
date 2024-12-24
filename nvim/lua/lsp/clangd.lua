local lspc = require("lspconfig")

lspc.clangd.setup({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp" },
	single_file_support = true,
	on_attach = function(client, bufnr)
		-- Enable autoformat on save
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_create_autocmd("BufWrite", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})
