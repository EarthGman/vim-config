# extra dependencies, language servers, tools, etc
{ pkgs, ... }:
with pkgs; [
  lazygit
  fd
  fzf
  ripgrep
  tree-sitter
]
