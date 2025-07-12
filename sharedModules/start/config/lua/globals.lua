local opt = vim.opt

vim.g.mapleader = " "
vim.o.background = "dark"
vim.cmd.colorscheme "vague"

vim.cmd.nnoremap("<C-d>", "<C-d>zz")
vim.cmd.nnoremap("<C-u>", "<C-u>zz")
opt.list = true
opt.listchars = [[trail:·,tab:▸\ ]]
vim.wo.relativenumber = true
vim.wo.number = true
opt.cmdheight = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.mouse = "a"               --mouse support in all modes (why not?)
opt.clipboard = "unnamedplus" --allow nvim to inherit the system clipboard
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
