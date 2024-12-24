{ pkgs, lib, config, ... }:
let
  inherit (lib) mkDefault mkIf;
  enable = config.programs.neovim.enable;
in
{
  programs.neovim = {
    package = pkgs.neovim-unwrapped;
    # provide aliases just in case nvim isn't recognized by something
    vimAlias = mkDefault true;
    viAlias = mkDefault true;
    vimdiffAlias = mkDefault true;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim # file search tui
      plenary-nvim # popular dependency needed by most vim plugins
      nvim-treesitter # treesitter configuration

      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.lua

      nvim-autopairs # auto match braces
      nvim-colorizer-lua # preview color codes
      lspkind-nvim # plugin to provide icons for various lsps 
      nvim-lspconfig # allow configuration of an lsp using lua
      gruvbox # pretty good theme
      harpoon # customizable file finder
      undotree # view undo history
      vim-fugitive # git stuff
      nvim-surround # https://github.com/kylechui/nvim-surround/
    ] ++ (with pkgs.extraVimPlugins; [
      # locally derived vim plugings
      nvim-vauge
      blink-cmp
    ]);

    extraPackages = with pkgs; [
      # packages accessible to vim but not placed on the main shell path
      nil # nix language server
      lua-language-server

      nixpkgs-fmt # nix formatter
      stylua # opionated Lua code formatter
    ];

    extraLuaConfig = builtins.readFile ../nvim/init.lua;
  };

  xdg.configFile = mkIf enable {
    # core
    "nvim/lua/core/keymap.lua".source = mkDefault ../nvim/lua/core/keymap.lua;
    "nvim/lua/core/options.lua".source = mkDefault ../nvim/lua/core/options.lua;
    # lsp
    "nvim/lua/lsp/lua_ls.lua".source = mkDefault ../nvim/lua/lsp/lua_ls.lua;
    "nvim/lua/lsp/nil.lua".source = mkDefault ../nvim/lua/lsp/nil.lua;
    # plugins
		"nvim/lua/plugins/nvim-surround.lua".source = mkDefault ../nvim/lua/plugins/nvim-surround.lua;
    "nvim/lua/plugins/autopairs.lua".source = mkDefault ../nvim/lua/plugins/autopairs.lua;
    "nvim/lua/plugins/colorizer.lua".source = mkDefault ../nvim/lua/plugins/colorizer.lua;
    "nvim/lua/plugins/fugitive.lua".source = mkDefault ../nvim/lua/plugins/fugitive.lua;
    "nvim/lua/plugins/harpoon.lua".source = mkDefault ../nvim/lua/plugins/harpoon.lua;
    "nvim/lua/plugins/telescope.lua".source = mkDefault ../nvim/lua/plugins/telescope.lua;
    "nvim/lua/plugins/treesitter.lua".source = mkDefault ../nvim/lua/plugins/treesitter.lua;
    "nvim/lua/plugins/undotree.lua".source = mkDefault ../nvim/lua/plugins/undotree.lua;
		"nvim/lua/plugins/blink-cmd.lua".source = mkDefault ../nvim/lua/plugins/blink-cmd.lua;
    # themes
    "nvim/lua/themes/gruvbox.lua".source = mkDefault ../nvim/lua/themes/gruvbox.lua;
    "nvim/lua/themes/vague.lua".source = mkDefault ../nvim/lua/themes/vague.lua;
  };
}
