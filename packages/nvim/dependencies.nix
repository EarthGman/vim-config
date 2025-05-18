# extra dependencies, language servers, tools, etc
{ pkgs, ... }:
with pkgs; [
  llvmPackages.clang-unwrapped
  nil
  nixpkgs-fmt
  lua-language-server
  stylua
  pyright
  yapf
  gopls
  go
]
