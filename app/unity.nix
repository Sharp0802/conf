{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (unityhub.override {
      extraLibs = p: [
        p.ncurses
      ];
    })
  ];
}
