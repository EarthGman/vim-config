{ pkgs, ... }:
with pkgs.vimPlugins;
[
  lspkind-nvim # plugin to provide icons for various lsps
  none-ls-nvim
  mini-icons
  nvim-web-devicons
  blink-cmp
  nvim-treesitter.withAllGrammars
  tiny-inline-diagnostic-nvim
  conform-nvim
  SchemaStore-nvim
  fidget-nvim
] ++ (with pkgs.extraVimPlugins; [
  direnv-nvim
])
