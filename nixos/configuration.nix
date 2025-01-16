{ pkgs, ... }:
{
  customRC = ''
    vim.cmd('luafile ${./init.lua}')
  '';
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
        alpha-nvim
        mini-icons
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
