{ ... }:
{
  nixpkgs.overlays = [
    (import ./hahmlet.nix)
    (import ./dwl)
    (import ./oo7.nix)
  ];
}
