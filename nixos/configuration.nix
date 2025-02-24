{ pkgs, ... }:
{
  customRC = "luafile ${./init.lua}";
  packages = {
    plugins = {
      start = with pkgs.vimPlugins; [
        harpoon
        lazy-nvim
        lspkind-nvim
        mini-icons
        nvim-autopairs
        nvim-lspconfig
        nvim-treesitter
        snacks-nvim
        which-key-nvim
      ] ++ (with pkgs.extraVimPlugins; [
        blink-cmp
        nvim-vauge
      ]) ++ (with pkgs.vimPlugins.nvim-treesitter-parsers; [
        nix
        lua
      ]);
    };
  };
}
