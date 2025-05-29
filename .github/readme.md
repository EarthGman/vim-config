# EarthGman's Neovim configuration

![nvim](https://raw.githubusercontent.com/EarthGman/vim-config/refs/heads/main/.github/nvim-dashboard.png)

A Neovim configuration designed to be standalone from NixOS or home-manager modules built using a nix flake for x86_64-linux, aarch64-linux, and aarch64-darwin. 

**Features**
- Snacks.nvim
- lspconfig and formatters for
	- Python
	- C & C++
	- Nix
	- Go
	- Lua
- Lazy loading through lz.n
- Whichkey.nvim
- 2 packages:
	- A full neovim with all 9 yards
	- nvim-lite for lightweight servers, excludes icons, lspconfig or other bloatware.

If you are running a system with nix installed you can give it a try right now!

just run:
```
nix run github:earthgman/vim-config
```

and Nix should take care of the rest.
- No plugin manager required
- All dependencies: fzf, lazygit, fd, ripgrep, LSP servers, etc are installed automatically
- Configuration is automatically applied

The first run will take some time to install the plugins and config files. Once the first run is complete, all files will be present in /nix/store until you run the garbage collector.

**If the above command doesn't work ensure that "flakes" and "nix-command" are enabled within your nix installation or NixOS configuration under nix.settings.experimental-features**

------------------------------------------------------------------------
# Installation

To install my Neovim persistently you can add
```flake.nix
inputs = {
  vim-config = {
    url = "github:earthgman/vim-config";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```
to your flake.nix

Then add:
```nix
{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
   environment.systemPackages = [
     (inputs.vim-config.packages.${system}.default)
   ];
}
```
to your configuration.nix

------------------------------------------------------------------------

**If you are using my nix-configuration I have provided a module for enabling a custom Neovim for both Nixos and home-manager modules.

```nix
   programs.neovim-custom.enable = true;
```

By default this will give you my Neovim. However you can package your own Neovim using the same method I have. Then you can specify:

```nix
  programs.neovim-custom.package = inputs.your-nvim.packages."${system}".default;
```

The module also comes with viAlias and vimAlias options.

-----------------------------------------------------------------------------------------------

Credit to viperML for the instructions to package Neovim with Nix. If you want to give it try, check out: https://ayats.org/blog/neovim-wrapper