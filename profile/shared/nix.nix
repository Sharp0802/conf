{ lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
      "nvidia-x11"
      "nvidia-settings"
      "unityhub"
    ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
