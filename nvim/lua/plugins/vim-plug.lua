local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('https://github.com/ThePrimeagen/harpoon.git')
Plug('https://github.com/nvim-telescope/telescope.nvim.git')
Plug('https://github.com/vague2k/vague.nvim.git')
Plug('https://github.com/kylechui/nvim-surround.git')
Plug('https://github.com/windwp/nvim-autopairs.git')
Plug('https://github.com/williamboman/mason.nvim.git')
Plug('https://github.com/tpope/vim-fugitive.git')
Plug('https://github.com/mbbill/undotree.git')
Plug('https://github.com/nvim-treesitter/nvim-treesitter.git')
Plug('https://github.com/norcalli/nvim-colorizer.lua.git')

vim.call('plug#end')
