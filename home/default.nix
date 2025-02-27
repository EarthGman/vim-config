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

      plugins = import ../plugins.nix { inherit pkgs; };

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
