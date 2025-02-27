{ pkgs, ... }:
{
  customRC = "luafile ${./init.lua}";
  packages = {
    plugins = {
      start = import ../plugins.nix { inherit pkgs; };
    };
  };
}
