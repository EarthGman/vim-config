{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blink-cmp.url = "github:saghen/blink.cmp";
    nix-library.url = "github:earthgman/nix-library";
  };

  outputs = { nixpkgs, nix-library, ... } @ inputs:
    let
      lib = nix-library.lib;
    in
    {
      homeManager = rec {
        neovim = import ./home;
        default = neovim;
      };
      nixos = rec {
        neovim = import ./nixos;

        default = neovim;
      };
      overlays = import ./overlays.nix;
      packages = lib.forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        import ./extra-plugins { inherit inputs pkgs; }
      );
    };
}
