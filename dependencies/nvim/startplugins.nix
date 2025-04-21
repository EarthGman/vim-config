{ pkgs, ... }:
with pkgs.vimPlugins;
[
  fzf-lua
  harpoon # customizable file finder
  lspkind-nvim # plugin to provide icons for various lsps
  none-ls-nvim
  mini-icons
  nvim-web-devicons
  nvim-autopairs # auto match braces
  nvim-colorizer-lua # preview color codes
  nvim-lspconfig # allow configuration of an lsp using lua
  nvim-surround # https://github.com/kylechui/nvim-surround/
  nvim-treesitter-parsers.cpp
  nvim-treesitter-parsers.lua
  nvim-treesitter-parsers.nix
  nvim-treesitter # treesitter configuration
  snacks-nvim # QOL
  which-key-nvim # keybind manager
  blink-cmp
]
++ (with pkgs.extraVimPlugins; [
  # locally derived vim plugings
  nvim-vague
])
