{ pkgs, ... }:
with pkgs.vimPlugins;
[
  fzf-lua
  harpoon
  nvim-colorizer-lua
  which-key-nvim
  vim-tmux-navigator
  mini-trailspace
  snacks-nvim
  mini-nvim
  lualine-nvim
  gitsigns-nvim
]
++ (with pkgs.extraVimPlugins; [
  nvim-vague
  direnv-nvim
  nvim-universal-clipboard
])
