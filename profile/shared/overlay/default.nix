{ ... }:
{
  nixpkgs.overlays = [
    (import ./hahmlet.nix)
    (import ./dwl)
  ];
}
