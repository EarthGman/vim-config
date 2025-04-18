{ pkgs, inputs, ... }:
let
  inherit (pkgs) callPackage system;
in
{
  extraVimPlugins = {
    nvim-vague = callPackage ./nvim-vague.nix { };
    blink-cmp = inputs.blink-cmp.packages.${system}.blink-cmp;
  };
}
