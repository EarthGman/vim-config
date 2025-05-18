{ pkgs
, vimUtils
}:

vimUtils.buildVimPlugin {
  name = "direnv-nvim";

  src = pkgs.fetchFromGitHub {
    owner = "NotAShelf";
    repo = "direnv.nvim";
    rev = "a2f1264909463fd012b7b0b6bbfebc282c5d2834";
    hash = "sha256-nAnZte8okf8V6gH2Egy/32o3W8xznbYhsYBPQ+9F470=";
  };
}
