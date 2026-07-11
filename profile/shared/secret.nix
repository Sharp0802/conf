{ pkgs, ... }:
{
  xdg.portal = {
    extraPortals = with pkgs; [
      oo7-portal
    ];

    config.common = {
      "org.freedesktop.impl.portal.Secret" = [ "oo7-portal" ];
    };
  };

  environment.systemPackages = with pkgs; [
    libsecret
  ];
}
