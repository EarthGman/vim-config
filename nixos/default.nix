{ pkgs, lib, config, ... }:
{
  options.modules.neovim.enable = lib.mkEnableOption "enable neovim";
  config = lib.mkIf config.modules.neovim.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      configure = import ./configuration.nix { inherit pkgs; };
    };

    environment = {
      systemPackages = with pkgs; [
        nil
        lua-language-server
        nixpkgs-fmt
        stylua
      ];

      etc."xdg/nvim/lua".source = ./shared;
    };
  };
}
