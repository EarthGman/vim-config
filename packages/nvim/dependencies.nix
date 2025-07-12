#extra dependencies, language servers, tools, etc
{ pkgs, ... }:
with pkgs; [
  gnutar
  gitMinimal
  curlMinimal
  llvmPackages.clang-tools # needed for nvim to find C libraries
  go
  nodejs-slim
  rustc
  cargo
  lldb
  glibc

  # language servers
  nil
  gopls
  vscode-langservers-extracted
  yaml-language-server
  rust-analyzer
  lua-language-server
  pyright

  # formatters
  rustfmt
  yapf
  nixfmt-rfc-style
  stylua
  xmlformat
  yamlfmt
  yq
  gofumpt
  shfmt
]
