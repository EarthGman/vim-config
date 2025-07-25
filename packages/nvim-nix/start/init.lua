require("init")
require("lsp")

vim.lsp.enable({
  "nix",
})

require("plugins.conform")
