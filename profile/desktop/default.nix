{ pkgs, lib, ... }:
let
  dwlUwsmStartup = pkgs.writeShellScript "dwl-uwsm-startup" ''
    exec <&-
    exec ${lib.getExe pkgs.uwsm} finalize
  '';

  dwlUwsm = pkgs.writeShellScript "dwl-uwsm" ''
    exec ${lib.getExe pkgs.dwl} -s ${dwlUwsmStartup}
  '';
in
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

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      dwl = {
        prettyName = "dwl";
        binPath = "${dwlUwsm}";
      };
    };
  };

  services.displayManager.ly = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    nautilus
    pwvucontrol
    wofi
  ];
}
