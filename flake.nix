{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = _: {
    homeManager = rec {
      neovim = import ./home;
      default = neovim;
    };
    nixos = rec {
      neovim = import ./nixos;
      default = neovim;
    };
  };
}
