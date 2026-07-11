{ pkgs, ... }:
{
  users.users."sharp0802" = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "seat"
      "podman"
    ];
  };
}
