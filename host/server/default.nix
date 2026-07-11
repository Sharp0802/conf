{
  app,
  dev,
  profile,
  user,
}:
let
  apps = with app; [
    git
    man
    nvim
  ];
in
{
  modules = [
    ./hardware-configuration.nix
  ]
  ++ [
    profile.server
    dev."MSI-CX62-6QD"
    user."sharp0802"
    user."seocaf2"
  ]
  ++ apps;
}
