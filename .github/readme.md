# EarthGman's custom Neovim configurations

![nvim](https://raw.githubusercontent.com/EarthGman/vim-config/refs/heads/main/.github/nvim-dashboard.png)

The advantages of using a nix flake to configure your neovim:
- access to nixpkgs, including plugin repo flakes, and the ability to override/lock plugin derivations declaratively.
- declarative packaging of multiple neovim configurations for easy consumption.
- versioning - you can roll back your neovim configuration any time if you dont like an update to neovim itself.
- if installed through nixos or home-manager, you will always have a stable version of your neovim installed, meaning you can work on your neovim without it breaking your existing config.
- no depedency plugin managers that break the unix philosophy (lazy.nvim)
- no reliance on NixOS, home-manager, or third party nix neovim module set. (configure your vim directly in lua)

Drawbacks:
- You will have to use nix to rebuild your neovim everytime you evaluate a change in the lua configuration.
While annoying, it is much faster than using NixOS or home-manager modules (it rebuilds in less than 3 seconds on my PC)

**Packages provided
- nvim - Fully custom neovim with all plugins and dependencies installed
- nvim-lite - A slimmer neovim without LSP or icons for servers or installer images.
- nvim-nix - nvim-lite but with the nix lsp installed.

If you are running a system with nix installed you can give it a try right now!

just run:

```
nix run github:earthgman/vim-config
```

and Nix should take care of the rest.

The first run will take some time to install the plugins and config files. Once the first run is complete, all files will be present in /nix/store until you run the garbage collector.

**If the above command doesn't work ensure that "flakes" and "nix-command" are enabled within your nix installation at /etc/nix/nix.conf or NixOS configuration under nix.settings.experimental-features**

------------------------------------------------------------------------
# Installation

To install my Neovim persistently you can add
```flake.nix
inputs = {
  gman-neovim = {
    url = "github:earthgman/vim-config";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```
to your flake.nix

Then add:

```nix
{ inputs, ... }:
nixpkgs.overlays = [ inputs.gman-neovim.overlays.default ];
```

to your configuration.nix

You will now have a scoped package set pkgs.gman with the custom neovims

Installation example:

```
{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.gman.nvim ];
}

or

{ pkgs, ... }:
{
  home.packages = [ pkgs.gman.nvim ];
}
```

------------------------------------------------------------------------

**If you are using my NixOS configuration, I have provided a module for enabling a custom Neovim for your NixOS configuration.

```nix
   programs.neovim-custom.enable = true;
```

By default this will give you my default Neovim "pkgs.gman.nvim". However you can specify any neovim package using

```nix
  programs.neovim-custom.package = pkgs.gman.nvim-lite; 
```

This could include your own packaged Neovim.

The module also comes with viAlias and vimAlias options.

-----------------------------------------------------------------------------------------------

Credit to viperML for the instructions to package Neovim with Nix. If you want to give it try, check out: https://ayats.org/blog/neovim-wrapper
