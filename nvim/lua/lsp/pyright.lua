local lspc = require("lspconfig")

lspc.pyright.setup({
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.py",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,

	-- no work :(
	-- settings = {
	-- 	['pyright'] = {
	-- 		formatting = {
	-- 			command = { "yapf -i vim.fn.expand('%:p')" },
	-- 		},
	-- 	},
	-- },
})
