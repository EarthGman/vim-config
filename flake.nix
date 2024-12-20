{
  description = "gman's neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    blink-cmp.url = "github:saghen/blink.cmp";
  };

  outputs = { ... } @ inputs:
    {
      homeManager = rec {
        neovim = import ./home;
        default = neovim;
      };

      nixos = rec {
        neovim = import ./nixos;
        default = neovim;
      };

      overlay = (final: _prev: import ../extra-plugins { pkgs = final; inherit inputs; });
    };
}
