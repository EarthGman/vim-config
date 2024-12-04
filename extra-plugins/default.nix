{ pkgs, ... }:
let
  inherit (pkgs) callPackage;
in
{
  extraVimPlugins.nvim-vauge = callPackage ./nvim-vauge.nix { };
}
