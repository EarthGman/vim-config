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
            outputs.overlays.extraPlugins
          ];
        };

        packages = import ./packages { inherit pkgs; };

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
            packages = final: prev: import ./packages { pkgs = final; };
          };
          default = extraPlugins;
        };
      };
    };
}
