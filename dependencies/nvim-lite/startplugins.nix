{ pkgs, ... }:
with pkgs.vimPlugins; [
  harpoon # customizable file finder
  nvim-autopairs # auto match braces
  nvim-colorizer-lua # preview color codes
  nvim-surround # https://github.com/kylechui/nvim-surround/
  snacks-nvim # QOL
  which-key-nvim # keybind manager
] ++ (with pkgs.extraVimPlugins; [
  # locally derived vim plugings
  nvim-vague
])

