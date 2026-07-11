{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    nixosConfigurations.laptop = {
      modules = [
        ./hardware-configuration.nix
        (import ./profile "desktop")
        (import ./app [
          "game"
          "git"
          "nvim"
          "zed"
        ])
        (import ./user [
          "sharp0802"
        ])
      ];
    };
    nixosConfigurations.server = {
      modules = [
        ./hardware-configuration.nix
        (import ./profile "server")
        (import ./app [ ])
        (import ./user [
          "sharp0802"
          "seocaf2"
        ])
      ];
    };
  };
}
