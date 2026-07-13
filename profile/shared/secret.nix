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
    oo7
    oo7-portal
    oo7-server
    cargo-credential-oo7
    git-credential-oo7
  ];
}
