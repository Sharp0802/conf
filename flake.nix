{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      host = import ./host { inherit lib; };
    in
    {
      nixosConfigurations.laptop = lib.nixosSystem host.laptop;
      nixosConfigurations.server = lib.nixosSystem host.server;
    };
}
