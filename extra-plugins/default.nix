{ pkgs, inputs, ... }:
let
  inherit (pkgs) callPackage system;
in
{
  extraVimPlugins.nvim-vauge = callPackage ./nvim-vauge.nix { };
  extraVimPlugins.blink-cmp = inputs.blink-cmp.packages.${system}.blink-cmp;
}
