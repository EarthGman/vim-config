{
  description = "gman's neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-library = {
      url = "github:earthgman/nix-library";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    let
      inherit (flake-parts.lib) mkFlake;
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    mkFlake { inherit inputs; } {
      inherit systems;
      perSystem =
        { pkgs, system, ... }:
        {
          # flake parts does not have built in support for applying overlays to the pkgs argument
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              inputs.nix-library.overlays.default
            ];
          };

          packages = import ./packages { inherit pkgs; };

          # needed because package name and binary name are different
          apps = rec {
            nvim = {
              type = "app";
              program = "${self.packages.${system}.nvim}/bin/nvim";
            };
            nvim-lite = {
              type = "app";
              program = "${self.packages.${system}.nvim-lite}/bin/nvim";
            };
            nvim-nix = {
              type = "app";
              program = "${self.packages.${system}.nvim-nix}/bin/nvim";
            };
            default = nvim;
          };
        };
      flake = {
        overlays = rec {
          packages = final: prev: {
            inherit (self.packages.${prev.system})
              nvim
              nvim-lite
              nvim-nix
              ;
          };
          default = packages;
        };
      };
    };
}
