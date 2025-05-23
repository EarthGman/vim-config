{ pkgs, ... }:
with pkgs.vimPlugins;
[
  lspkind-nvim # plugin to provide icons for various lsps
  none-ls-nvim
  mini-icons
  nvim-web-devicons
  nvim-surround # https://github.com/kylechui/nvim-surround/
  nvim-treesitter-parsers.cpp
  nvim-treesitter-parsers.lua
  nvim-treesitter-parsers.nix
  nvim-treesitter # treesitter configuration
  blink-cmp
] ++ (with pkgs.extraVimPlugins; [
  direnv-nvim
])
