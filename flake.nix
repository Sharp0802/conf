{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs }:
    let
      lib = nixpkgs.lib;
      makeSystem =
        {
          profile,
          device,
          apps,
          users,
        }:
        lib.nixosSystem {
          modules = [
            ./hardware-configuration.nix
            (import ./profile profile)
            (import ./dev device)
            (import ./app apps)
            (import ./user users)
          ];
        };
    in
    {
      nixosConfigurations.laptop = makeSystem {
        profile = "desktop";
        device = "LEN-16AFR10-83F2";
        apps = [
          "game"
          "git"
          "nvim"
          "zed"
        ];
        users = [ "sharp0802" ];
      };

      nixosConfigurations.server = makeSystem {
        profile = "server";
        device = "MSI-CX62-6QD";
        apps = [ ];
        users = [
          "sharp0802"
          "seocaf2"
        ];
      };
    };
}
