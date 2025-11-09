{ pkgs, ... }:
with pkgs.vimPlugins;
[
  fzf-lua
  nvim-surround
  nvim-colorizer-lua
  which-key-nvim
  vim-tmux-navigator
  snacks-nvim
  lualine-nvim
  gitsigns-nvim
  nvim-vague
  nvim-universal-clipboard
]
