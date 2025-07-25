{ pkgs, ... }:
let
  inherit (pkgs) callPackage;

  sharedStartPlugins = import ../sharedModules/start/plugins.nix { inherit pkgs; };
  sharedOptPlugins = import ../sharedModules/opt/plugins.nix { inherit pkgs; };
  sharedDependencies = import ../sharedModules/dependencies.nix { inherit pkgs; };
in
rec {
  # full neovim
  nvim = callPackage ../neovim.nix {
    packageName = "nvim";
    startPlugins = import ./nvim/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
    optPlugins = import ./nvim/opt/plugins.nix { inherit pkgs; } ++ sharedOptPlugins;
    dependencies = import ./nvim/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
  };

  # neovim with only the nix language server and formatter (for my installer iso)
  nvim-nix = callPackage ../neovim.nix {
    packageName = "nvim-nix";
    startPlugins = import ./nvim-nix/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
    optPlugins = sharedOptPlugins;
    dependencies = import ./nvim-nix/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
  };

  # lightweight neovim with no lsp support. For managing servers.
  nvim-lite = callPackage ../neovim.nix {
    packageName = "nvim-lite";
    startPlugins = import ./nvim-lite/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
    optPlugins = sharedOptPlugins;
    dependencies = import ./nvim-lite/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
  };

  default = nvim;
}
