require("init")
require("lsp")
vim.lsp.enable({
  "rust",
  "go",
  "nix",
  "lua",
  "python",
  "c",
  "json",
  "yaml",
})

require("plugins.nvim-treesitter")
require("plugins.tiny-inline")
require("plugins.blink-cmp")
require("plugins.conform")
