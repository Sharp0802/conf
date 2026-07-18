{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ shikane ];

  systemd.user.services.shikane = {
    enable = true;
    description = "Shikane, A monitor configuration tool";
    after = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    environment = {
      SHIKANE_LOG = "debug";
    };
    serviceConfig = {
      ExecStart = "${lib.getExe pkgs.shikane}";
      Restart = "on-failure";
      RestartSec = "3";
    };
  };
}
