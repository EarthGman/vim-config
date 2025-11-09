--shared lua module for all neovim packages
--this file is not a traditional neovim init file rather just a lua module that must be manually loaded
--specify require("init") in /packages/${package name}/start/init.lua (the actual init file)
require("globals")

require("plugins.colorizer")
require("plugins.nvim-surround")
require("plugins.lualine")
require("plugins.snacks")
require("plugins.whichkey")
require("plugins.nvim-universal-clipboard")
