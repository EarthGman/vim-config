{ pkgs, lib, config, ... }:
let
  cfg = config.programs.neovim;
  inherit (lib) mkIf mkDefault;
in
{
  nixpkgs.overlays = [
    (final: _prev: import ../extra-plugins { pkgs = final; })
  ];

  programs.neovim = {
    package = pkgs.neovim-unwrapped;
    # provide aliases just in case nvim isn't recognized by something
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim # file search tui
      plenary-nvim # popular dependency needed by most vim plugins
      nvim-treesitter # treesitter configuration
      nvim-treesitter.withAllGrammars # TODO: add only needed languages (will save ~200Mb of disk)
      nvim-autopairs # auto match braces
      nvim-colorizer-lua # preview color codes
      lspkind-nvim # plugin to provide icons for various lsps 
      nvim-lspconfig # allow configuration of an lsp using lua
      gruvbox # pretty good theme
      harpoon # customizable file finder
      undotree # view undo history
      vim-fugitive # git stuff
    ] ++ (with pkgs.extraVimPlugins; [
      # locally derived vim plugings
      nvim-vauge
    ]);

    extraPackages = with pkgs; [
      # packages accessible to vim but not placed on the main shell path
      nil # nix language server
      lua-language-server

      nixpkgs-fmt # nix formatter
      stylua # opionated Lua code formatter
    ];
    extraLuaConfig = builtins.readFile ./init.lua;
  };

  xdg.configFile."nvim/lua" = mkIf cfg.enable {
    source = ./lua;
  };
}
