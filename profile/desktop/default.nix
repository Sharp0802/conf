{ pkgs, ... }:
{
  programs.dwl.enable = true;
  programs.firefox.enable = true;
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
    nautilus
    pwvucontrol
    wofi
  ];

  imports = [
    ./audio.nix
    ./font.nix
    ./input.nix
    ./nm.nix
    ./tlp.nix
    ./xdg.nix
  ];
}
