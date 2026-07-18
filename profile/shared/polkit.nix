{ ... }:
{
  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  security.soteria.enable = true;

  systemd.user.services.polkit-soteria = {
    serviceConfig = {
      EnvironmentFile = "-%t/uwsm/env_session.conf";
    };
  };
}
