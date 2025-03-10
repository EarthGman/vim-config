{ symlinkJoin
, pkgs
, packageName
, neovim-unwrapped
, makeWrapper
, runCommandLocal
, lib
,
}:
let
  inherit packageName;

  startPlugins = import ./plugins.nix { inherit pkgs; };

  extraPackages = import ./dependencies.nix { inherit pkgs; };

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
  name = packageName;
  paths = [ neovim-unwrapped ];

  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
        wrapProgram $out/bin/nvim \
          --add-flags '-u' \
          --add-flags '${./config/init.lua}' \
          --add-flags '--cmd' \
          --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
          --set-default NVIM_APPNAME nvim \
    			--suffix PATH : ${lib.makeBinPath extraPackages}
  '';

  passthru = {
    inherit packpath;
  };
}
