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
      # it exits with 0 even if it failed to find wayland socket.
      # since dwl session starts from tty, 'always' is needed.
      Restart = "always";
      RestartSec = "1";
    };
  };
}
