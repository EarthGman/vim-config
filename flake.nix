{
  description = "neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = _: {
    homeManagerModule = rec {
      neovim = import ./nvim;
      default = neovim;
    };
  };
}
