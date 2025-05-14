{
  description = "gman's neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blink-cmp.url = "github:saghen/blink.cmp";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, flake-parts, ... } @ inputs:
    let
      inherit (flake-parts.lib) mkFlake;
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    mkFlake { inherit inputs; } {
      inherit systems;
      perSystem = { pkgs, system, ... }: {
        # flake parts does not have built in support for applying overlays to the pkgs argument
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [
            outputs.overlays.default
          ];
        };

        packages =
          let
            sharedStartPlugins = import ./packages/shared/startplugins.nix { inherit pkgs; };
            sharedExtraPackages = import ./packages/shared/extrapackages.nix { inherit pkgs; };
          in
          rec {
            nvim = pkgs.callPackage ./neovim.nix {
              packageName = "nvim";
              startPlugins = import ./packages/nvim/startplugins.nix { inherit pkgs; } ++ sharedStartPlugins;
              dependencies = import ./packages/nvim/extrapackages.nix { inherit pkgs; } ++ sharedExtraPackages;
              init = ./packages/nvim/init.lua;
            };

            nvim-lite = pkgs.callPackage ./neovim.nix {
              packageName = "nvim-lite";
              startPlugins = import ./packages/nvim-lite/startplugins.nix { inherit pkgs; } ++ sharedStartPlugins;
              dependencies = import ./packages/nvim-lite/extrapackages.nix { inherit pkgs; } ++ sharedExtraPackages;
              init = ./packages/nvim-lite/init.lua;
            };

            default = nvim;
          };

        apps = rec {
          nvim = {
            type = "app";
            program = "${self.packages.${system}.nvim}/bin/nvim";
          };
          nvim-lite = {
            type = "app";
            program = "${self.packages.${system}.nvim-lite}/bin/nvim";
          };
          default = nvim;
        };
      };
      flake = {
        overlays = rec {
          extraPlugins = final: prev: import ./extra-plugins { pkgs = final; inherit inputs; };
          default = extraPlugins;
        };
      };
    };
}
