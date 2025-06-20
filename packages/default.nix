{ pkgs, ... }:
let
  inherit (pkgs) callPackage;

  sharedStartPlugins = import ../sharedModules/start/plugins.nix { inherit pkgs; };
  sharedOptPlugins = import ../sharedModules/opt/plugins.nix { inherit pkgs; };
  sharedDependencies = import ../sharedModules/dependencies.nix { inherit pkgs; };
in
rec {
  nvim = callPackage ../neovim.nix {
    packageName = "nvim";
    startPlugins = import ./nvim/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
    optPlugins = import ./nvim/opt/plugins.nix { inherit pkgs; } ++ sharedOptPlugins;
    dependencies = import ./nvim/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
  };
  nvim-lite = callPackage ../neovim.nix {
    packageName = "nvim-lite";
    startPlugins = import ./nvim-lite/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
    optPlugins = sharedOptPlugins;
    dependencies = import ./nvim-lite/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
  };

  default = nvim;
}
