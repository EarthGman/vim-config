{ pkgs, ... }:
with pkgs.vimPlugins;
[
  lspkind-nvim # plugin to provide icons for various lsps
  none-ls-nvim
  mini-icons
  nvim-web-devicons
  nvim-surround # https://github.com/kylechui/nvim-surround/
  blink-cmp
  nvim-treesitter.withAllGrammars
  tiny-inline-diagnostic-nvim
] ++ (with pkgs.extraVimPlugins; [
  direnv-nvim
])
