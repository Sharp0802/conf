{
  app,
  dev,
  profile,
  user,
}:
let
  apps = with app; [
    direnv
    game
    git
    man
    media
    nvim
    vpn
    zed
  ];
in
{
  modules = [
    ./hardware-configuration.nix
  ]
  ++ [
    profile.desktop
    dev."LEN-16AFR10-83F2"
    user."sharp0802"
  ]
  ++ apps;
}
