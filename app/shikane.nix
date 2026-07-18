{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ shikane ];

  systemd.user.services.shikane = {
    enable = true;
    description = "Shikane, A monitor configuration tool";
    after = ["default.target"];
    wantedBy = ["default.target"];
    serviceConfig = {
      ExecStart = "${lib.getExe pkgs.shikane}";
      Restart = "on-failure";
      RestartSec = "1";
    };
  };
}
