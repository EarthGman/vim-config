{ pkgs, lib, config, ... }:
let
  inherit (lib) mkDefault mkIf;
in
{
  nixpkgs.overlays = [
    (final: _prev: import ../extra-plugins { pkgs = final; })
  ];

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
      nvim-treesitter.withAllGrammars # TODO: add only needed languages (will save ~200Mb of disk)
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
    ]);

    extraPackages = with pkgs; [
      # packages accessible to vim but not placed on the main shell path
      nil # nix language server
      lua-language-server

      nixpkgs-fmt # nix formatter
      stylua # opionated Lua code formatter
    ];
    extraLuaConfig = mkDefault (builtins.readFile ./init.lua);
  };

  xdg.configFile = mkIf config.programs.neovim.enable {
    # core
    "nvim/lua/core/keymap.lua".source = mkDefault ./lua/core/keymap.lua;
    "nvim/lua/core/options.lua".source = mkDefault ./lua/core/options.lua;
    # lsp
    "nvim/lua/lsp/lua_ls.lua".source = mkDefault ./lua/lsp/lua_ls.lua;
    "nvim/lua/lsp/nil.lua".source = mkDefault ./lua/lsp/nil.lua;
    # plugins
    "nvim/lua/plugins/autopairs.lua".source = mkDefault ./lua/plugins/autopairs.lua;
    "nvim/lua/plugins/colorizer.lua".source = mkDefault ./lua/plugins/colorizer.lua;
    "nvim/lua/plugins/fugitive.lua".source = mkDefault ./lua/plugins/fugitive.lua;
    "nvim/lua/plugins/harpoon.lua".source = mkDefault ./lua/plugins/harpoon.lua;
    "nvim/lua/plugins/telescope.lua".source = mkDefault ./lua/plugins/telescope.lua;
    "nvim/lua/plugins/treesitter.lua".source = mkDefault ./lua/plugins/treesitter.lua;
    "nvim/lua/plugins/undotree.lua".source = mkDefault ./lua/plugins/undotree.lua;
    # themes
    "nvim/lua/themes/chatgpt.lua".source = mkDefault ./lua/themes/chatgpt.lua;
    "nvim/lua/themes/gruvbox.lua".source = mkDefault ./lua/themes/gruvbox.lua;
    "nvim/lua/themes/vague.lua".source = mkDefault ./lua/themes/vague.lua;
  };
}
