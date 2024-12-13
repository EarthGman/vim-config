{ pkgs, ... }:
{
  customRC = "luafile ${./init.lua}";
  packages.myPlugins = {
    start = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      nvim-treesitter
      nvim-autopairs
      lspkind-nvim
      harpoon
      undotree
      vim-fugitive
    ] ++ (with pkgs.vim-plugins.nvim-treesitter-parsers; [
      nix
      lua
    ]);
  };
}
