{
  symlinkJoin,
  packageName,
  startPlugins ? [ ],
  optPlugins ? [ ],
  dependencies,
  neovim-unwrapped,
  makeWrapper,
  runCommandLocal,
  lib,
}:
let
  inherit packageName;
  init = ./packages/${packageName}/start/init.lua;
  foldPlugins = builtins.foldl' (
    acc: next:
    acc
    ++ [
      next
    ]
    ++ (foldPlugins (next.dependencies or [ ]))
  ) [ ];

  linkPlugins = type: plugins: ''
    ${lib.concatMapStringsSep "\n" (
      plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/${type}/${lib.getName plugin}"
    ) plugins}
  '';

  startPluginsWithDeps = lib.unique (foldPlugins startPlugins);

  packpath = runCommandLocal "nvim-config" { } (
    ''
      mkdir -p $out/pack/${packageName}/{start,opt}

      ln -vsfT ${./sharedModules/start/config} $out/pack/${packageName}/start/config
    ''
    + linkPlugins "start" startPluginsWithDeps
    + linkPlugins "opt" optPlugins
  );
in
symlinkJoin {
  name = packageName;
  paths = [ neovim-unwrapped ];

  nativeBuildInputs = [ makeWrapper ];
  postBuild = ''
        wrapProgram $out/bin/nvim \
          --add-flags '-u' \
          --add-flags '${init}' \
          --add-flags '--cmd' \
          --add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
          --set-default NVIM_APPNAME nvim \
    			--suffix PATH : ${lib.makeBinPath dependencies}
  '';

  passthru = {
    inherit packpath;
  };
}
