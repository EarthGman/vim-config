#extra dependencies, language servers, tools, etc
{ pkgs, ... }:
with pkgs; [
  gnutar
  gitMinimal
  curlMinimal
  llvmPackages.clang-tools # needed for nvim to find C libraries
  nil
  nixpkgs-fmt
  lua-language-server
  stylua
  pyright
  yapf
  gopls
  go
  nodejs-slim
  rust-analyzer
  rustfmt
  rustc
  cargo
  lldb
  glibc
]
