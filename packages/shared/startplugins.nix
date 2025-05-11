{ pkgs, ... }:
with pkgs.vimPlugins;
[
  fzf-lua
  harpoon
  nvim-autopairs
  nvim-colorizer-lua
  nvim-surround
  snacks-nvim
  which-key-nvim
  vim-tmux-navigator
  mini-trailspace
] ++ (with pkgs.extraVimPlugins; [
  nvim-vague
])
