local lspc = require("lspconfig")

lspc.clangd.setup({
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp" },
	single_file_support = true,
})
