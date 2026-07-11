{ pkgs, ... }:
{
  imports = [
    ../shared

    ./audio.nix
    ./font.nix
    ./input.nix
    ./nm.nix
    ./tlp.nix
    ./xdg.nix
  ];

  programs.dwl.enable = true;
  programs.foot.enable = true;

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
    brightnessctl
    nautilus
    pwvucontrol
    wofi
  ];
}
