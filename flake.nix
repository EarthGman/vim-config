{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { ... }: {
    homeManagerModule = rec {
      neovim = import ./nvim;
      default = neovim;
    };
  };
}
