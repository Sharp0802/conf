profile:
{ lib, ... }:
{
  imports = [
    ./overlay
    ./shared
    (./. + "/${profile}")
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "nvidia-x11"
      "nvidia-settings"
    ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
