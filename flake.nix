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
            outputs.overlay.default
          ];
        };
        packages.default = pkgs.callPackage ./neovim.nix { inherit pkgs; };
        apps.default = {
          type = "app";
          program = pkgs.callPackage ./neovim.nix { inherit pkgs; };
        };
        devShells.default = pkgs.mkShell {
          shellHook = ''
            ${outputs.packages.${system}.default}/bin/nvim
          '';
        };
      };
      flake = {
        overlay = rec {
          extraPlugins = final: _prev: import ./extra-plugins { pkgs = final; inherit inputs; };
          default = extraPlugins;
        };
      };
    };
}
