local wk = require("which-key")

require("mini.ai").setup()
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.files").setup()

wk.add({
  { "<Leader>mf", function() MiniFiles.open() end, desc = "Mini Files" },
})
