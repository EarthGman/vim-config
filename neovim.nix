{ symlinkJoin
, pkgs
, neovim-unwrapped
, makeWrapper
, runCommandLocal
, vimPlugins
, lib
,
}:
let
  packageName = "mypackage";

  startPlugins = import ./plugins.nix { inherit pkgs; };

  extraPackages = with pkgs; [
    llvmPackages.clang-unwrapped
    nil
    nixpkgs-fmt
    lua-language-server
    stylua
    lazygit
    fd
    fzf
    ripgrep
  ];

  foldPlugins = builtins.foldl'
    (
      acc: next:
        acc
        ++ [
          next
        ]
        ++ (foldPlugins (next.dependencies or [ ]))
    ) [ ];

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "packpath" { } ''
    mkdir -p $out/pack/${packageName}/{start,opt}

    ln -vsfT ${./config} $out/pack/${packageName}/start/config
    ${
      lib.concatMapStringsSep
      "\n"
      (plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
      startPluginsWithDeps
    }

  '';
in
symlinkJoin {
  name = "nvim";
  paths = [ neovim-unwrapped ];

  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
        wrapProgram $out/bin/nvim \
          --add-flags '-u' \
          --add-flags '${./config/plugin/init.lua}' \
          --add-flags '--cmd' \
          --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
          --set-default NVIM_APPNAME nvim \
    			--suffix PATH : ${lib.makeBinPath extraPackages}
  '';

  passthru = {
    inherit packpath;
  };
}
