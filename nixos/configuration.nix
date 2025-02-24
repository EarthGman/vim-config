{ pkgs, ... }:
{
  customRC = ''
    lua << EOF
      ${(builtins.readFile ./init.lua)};
    EOF
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
        nvim-snacks
        nvim-treesitter
        undotree
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
