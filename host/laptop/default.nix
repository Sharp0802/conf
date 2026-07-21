{
  app,
  dev,
  profile,
  user,
}:
let
  apps = with app; [
    bluetooth
    direnv
    game
    git
    isolcpu
    man
    media
    nvim
    shikane
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
