# EarthGman's custom Neovim configurations

![nvim](https://raw.githubusercontent.com/EarthGman/vim-config/refs/heads/main/.github/nvim-dashboard.png)

Utilizing the power of nix flakes, I can create several independent Neovim packages that can be run on any system with nix installed. No dependence NixOS modules, home-manager modules, nixvim, mason, lazy-nvim, or any plugin managers is required.

**Features**
- Truly declarative.
- lazygit-integration
- snacks-nvim
- mini-nvim
- treesitter syntax highlighting
- whichkey
- LSP: cpp, C, rust, python, lua, nix, and go.
- overlay for NixOS or home-manager configurations.

**Packages
- nvim - Fully custom neovim with all plugins and dependencies installed
- nvim-lite - A slimmer neovim without LSP or icons for servers or installer images.

If you are running a system with nix installed you can give it a try right now!

just run:

```
nix run github:earthgman/vim-config
```

and Nix should take care of the rest.

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
nixpkgs.overlays = [ inputs.vim-config.overlays.default ];
```

to your configuration.nix

Now you will have "nvim" and "nvim-lite" attached to your "pkgs" argument

```
{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.nvim ];
}
```

------------------------------------------------------------------------

**If you are using my NixOS-configuration I have provided a module for enabling a custom Neovim for both Nixos and home-manager.

```nix
   programs.neovim-custom.enable = true;
```

By default this will give you my default Neovim "nvim". However you can specify any neovim package using

```nix
  programs.neovim-custom.package = pkgs.nvim-lite; 
```

This could include your own Neovim.

The module also comes with viAlias and vimAlias options.

-----------------------------------------------------------------------------------------------

Credit to viperML for the instructions to package Neovim with Nix. If you want to give it try, check out: https://ayats.org/blog/neovim-wrapper