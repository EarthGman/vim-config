{ pkgs, ... }:
with pkgs.vimPlugins;
[
  fzf-lua
  harpoon
  nvim-colorizer-lua
  # nvim-surround
  which-key-nvim
  vim-tmux-navigator
  mini-trailspace
  snacks-nvim
  mini-nvim
] ++ (with pkgs.extraVimPlugins; [
  nvim-vague
  direnv-nvim
  lzn
  nvim-universal-clipboard
])
