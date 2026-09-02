{ pkgs, lib, ... }:
let
  dwlUwsmStartup = pkgs.writeShellScript "dwl-uwsm-startup" ''
    exec <&-
    exec ${lib.getExe pkgs.uwsm} finalize
  '';

  dwlStatus =
  let
    cat = "${pkgs.coreutils}/bin/cat";
    date = "${pkgs.coreutils}/bin/date";
    printf = "${pkgs.coreutils}/bin/printf";
    sleep = "${pkgs.coreutils}/bin/sleep";
  in
  pkgs.writeShellScript "dwl-status" ''
    while true; do
      bat="$(${cat} /sys/class/power_supply/BAT0/capacity)"
      dat="$(${date} +'%F %T')"
      ${printf} 'BAT %s%% | %s\n' "$bat" "$dat"
      ${sleep} 1
    done
  '';

  dwlUwsm = pkgs.writeShellScript "dwl-uwsm" ''
    ${dwlStatus} | exec ${lib.getExe pkgs.dwl} -s ${dwlUwsmStartup}
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
    ./vm.nix
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
        comment = "DWL managed by UWSM";
        binPath = "${dwlUwsm}";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    nautilus
    pwvucontrol
    wofi
  ];
}
