{ pkgs, ... }:
{
  services.oo7.enable = true;

  security.pam.services = {
    login = {
      oo7.enable = true;
    };
  };

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
    cargo-credential-oo7
    git-credential-oo7
  ];
}
