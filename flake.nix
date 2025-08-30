{
  description = "gman's neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
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
          _module.args.pkgs =
            let
              extraVimPlugins = {
                nvim-vague = pkgs.vimUtils.buildVimPlugin {
                  name = "nvim-vague";
                  src = pkgs.fetchFromGitHub {
                    owner = "vague2k";
                    repo = "vague.nvim";
                    rev = "ceeac4d04faaa83df542992098e01d893a20b5b3";
                    sha256 = "10dk3vxdn7s2kaya0zqapls5dkl00qbdi3lzpxsjw0g1ga8cwdxz";
                  };
                };
                nvim-universal-clipboard = pkgs.vimUtils.buildVimPlugin {
                  name = "nvim-universal-clipboard";
                  src = pkgs.fetchFromGitHub {
                    owner = "swaits";
                    repo = "universal-clipboard.nvim";
                    rev = "48a625ab592633a05446ef66031611593a5b55d9";
                    hash = "sha256-YnZ9VJj2Mr45ku6WaF897FCmIFeI4Sj2F31iyzSUY9E=";
                  };
                };
              };
            in
            import inputs.nixpkgs {
              inherit system;
              overlays = [
                (final: prev: {
                  vimPlugins = prev.vimPlugins // extraVimPlugins;
                })
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
