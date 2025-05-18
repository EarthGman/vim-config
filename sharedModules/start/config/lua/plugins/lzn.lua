-- lazy loading for all configured lsps
require("lz.n").load {
	{
		"nvim-lspconfig",

		ft = {
			"nix",
			"python",
			"lua",
			"c",
			"h",
			"cpp",
			"hpp",
			"go",
			"lua"
		},

		after = function()
			require("lsp")
		end
	},
}
