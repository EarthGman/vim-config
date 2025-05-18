{
  description = "gman's neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blink-cmp.url = "github:saghen/blink.cmp";
    lzn.url = "github:nvim-neorocks/lz.n";
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
            inherit (pkgs) callPackage;
            sharedStartPlugins = import ./sharedModules/start/plugins.nix { inherit pkgs; };
            sharedOptPlugins = import ./sharedModules/opt/plugins.nix { inherit pkgs; };
            sharedDependencies = import ./sharedModules/dependencies.nix { inherit pkgs; };
          in
          rec {
            nvim = callPackage ./neovim.nix {
              packageName = "nvim";
              startPlugins = import ./packages/nvim/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
              optPlugins = import ./packages/nvim/opt/plugins.nix { inherit pkgs; } ++ sharedOptPlugins;
              dependencies = import ./packages/nvim/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
            };

            nvim-lite = callPackage ./neovim.nix {
              packageName = "nvim-lite";
              startPlugins = import ./packages/nvim-lite/start/plugins.nix { inherit pkgs; } ++ sharedStartPlugins;
              optPlugins = sharedOptPlugins;
              dependencies = import ./packages/nvim-lite/dependencies.nix { inherit pkgs; } ++ sharedDependencies;
            };

            # extraPlugins
            nvim-vague = callPackage ./extra-plugins/nvim-vague.nix { };
            blink-cmp = inputs.blink-cmp.packages.${system}.blink-cmp;
            direnv-nvim = callPackage ./extra-plugins/direnv-nvim.nix { };
            lzn = inputs.lzn.packages.${system}.default;

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
          extraPlugins = final: prev: {
            extraVimPlugins = import ./extra-plugins {
              pkgs = final; inherit inputs;
            };
          };
          default = extraPlugins;
        };
      };
    };
}
