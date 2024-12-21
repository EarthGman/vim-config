--init.lua for imperative configuration
require("core.options")
require("core.keymap")

--package managers
require("plugins.vim-plug")
require("plugins.mason")

--plugins
require("plugins.nvim-surround")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.autopairs")
require("plugins.harpoon")
require("plugins.undotree")
require("plugins.fugitive")
require("plugins.colorizer")
require("plugins.blink.cmp")

--themes
--require("themes.gruvbox")
require("themes.vague")

--LSP
require("lsp.nil")
require("lsp.lua_ls")
