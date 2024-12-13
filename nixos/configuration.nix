{ pkgs, ... }:
{
  customRC = "luafile ${./init.lua}";
  packages = {
    plugins = {
      start = with pkgs.vimPlugins; [
        plenary-nvim
        telescope-nvim
        nvim-treesitter
        nvim-autopairs
        lspkind-nvim
        nvim-lspconfig
        harpoon
        undotree
        vim-fugitive
      ] ++ (with pkgs.vimPlugins.nvim-treesitter-parsers; [
        nix
        lua
      ]);
    };
  };
}
