{ pkgs, ... }:
let
  unityhub = pkgs.unityhub.override {
    extraLibs = p: [
      p.ncurses
    ];
    extraPkgs = p: [
      p.ncurses
    ];
    buildFHSEnv = args:
      pkgs.buildFHSEnv (args // {
        profile = (args.profile or "") + ''
          export LD_LIBRARY_PATH="${
            pkgs.lib.makeLibraryPath [ pkgs.ncurses ]
          }''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
        '';
      });
  };
in
{
  environment.systemPackages = [
    unityhub
    unityhub.fhsEnv
  ];
}
