{ pkgs, lib, ... }:
{
  imports = [
    ../shared

    ./audio.nix
    ./font.nix
    ./input.nix
    ./nm.nix
    ./tlp.nix
    ./vm.nix
    ./xdg.nix
  ];

  programs.niri.enable = true;
  programs.waybar.enable = true;

  programs.dconf = {
    profiles.user.databases = [
      {
        lockAll = true;
        settings = {
          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    fuzzel
    nautilus
    pwvucontrol
    xwayland-satellite
  ];
}
