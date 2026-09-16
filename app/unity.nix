{ pkgs, ... }:
let
  unityhub = unityhub.override {
    extraLibs = p: [
      p.ncurses
    ];
  };
in
{
  environment.systemPackages = [
    unityhub
    unityhub.fhsEnv
  ];
}
