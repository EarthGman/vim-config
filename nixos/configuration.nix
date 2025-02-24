{ pkgs, ... }:
{
  customRC = ''
    lua require("core.options")
    lua require("plugins.blink-cmp")
    lua require("plugins.autopairs")
    lua require("plugins.whichkey")
    lua require("plugins.snacks")

    lua require("lsp.nil")
    lua require("lsp.lua_ls")
  '';
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
