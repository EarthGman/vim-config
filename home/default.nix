{ pkgs, lib, config, ... }:
let
  inherit (lib) mkDefault mkIf mkEnableOption;
  cfg = config.programs.neovim;
in
{
  options.programs.neovim.imperativeLua = mkEnableOption "enable imperative lua configuration";

  config = {
    programs.neovim = {
      package = pkgs.neovim-unwrapped;
      # provide aliases just in case nvim isn't recognized by something
      vimAlias = mkDefault true;
      viAlias = mkDefault true;
      vimdiffAlias = mkDefault true;

      plugins = with pkgs.vimPlugins; [
        which-key-nvim # keybind manager
        telescope-nvim # file search tui
        plenary-nvim # popular dependency needed by most vim plugins
        nvim-treesitter # treesitter configuration
        nvim-autopairs # auto match braces
        nvim-colorizer-lua # preview color codes
        lspkind-nvim # plugin to provide icons for various lsps 
        nvim-lspconfig # allow configuration of an lsp using lua
        gruvbox # pretty good theme
        harpoon # customizable file finder
        undotree # view undo history
        vim-fugitive # git stuff
        nvim-surround # https://github.com/kylechui/nvim-surround/
        alpha-nvim

        nvim-treesitter-parsers.nix
        nvim-treesitter-parsers.lua

        nvim-treesitter-parsers.cpp

        nvim-gdb

      ] ++ (with pkgs.extraVimPlugins; [
        # locally derived vim plugings
        nvim-vauge
        blink-cmp
      ]);

      extraPackages = with pkgs; [
        # packages accessible to vim but not placed on the main shell path
        nil # nix language server
        lua-language-server
        pyright # python language server
        clang-tools
        python3

        nixpkgs-fmt # nix formatter
        stylua # opionated Lua code formatter
        yapf # yet another python formatter
      ];

      extraLuaConfig = mkIf (!(cfg.imperativeLua)) (builtins.readFile ../nvim/init.lua);
    };

    xdg.configFile."nvim/lua" = mkIf (!(cfg.imperativeLua)) {
      source = ../nvim/lua;
    };
  };
}
