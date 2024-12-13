local lspc = require("lspconfig")

lspc.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				-- make Neovim runtime files available to the server
				library = vim.api.nvim_get_runtime_file('', true),
				-- Prevent prompts for third-party libraries
				checkThirdParty = false,
			},
			telemetry = { enable = false, }, -- don't track me
		}
	},
	on_attach = function()
		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.lua",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
}
