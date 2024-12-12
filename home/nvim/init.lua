require("core.keymap")
require("core.options")

require("nvim-surround").setup()

--require('themes.chatgpt').apply()

require("plugins.telescope")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.harpoon")
require("plugins.undotree")
require("plugins.fugitive")
require("plugins.colorizer")

-- require("themes.gruvbox")
require("themes.vague")


require("lsp.nil")
require("lsp.lua_ls")
