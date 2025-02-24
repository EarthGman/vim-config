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
        gruvbox # pretty good theme
        harpoon # customizable file finder
        lazy-nvim # package manager
        lspkind-nvim # plugin to provide icons for various lsps 
        mini-icons
        nvim-autopairs # auto match braces
        nvim-colorizer-lua # preview color codes
        nvim-gdb
        nvim-lspconfig # allow configuration of an lsp using lua
        nvim-surround # https://github.com/kylechui/nvim-surround/
        nvim-treesitter-parsers.cpp
        nvim-treesitter-parsers.lua
        nvim-treesitter-parsers.nix
        nvim-treesitter # treesitter configuration
        snacks-nvim # QOL
        undotree # view undo history
        which-key-nvim # keybind manager
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
