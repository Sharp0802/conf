{ lib, ... }:
let
  entries = builtins.readDir ./.;
  dirs = builtins.filter (file: file != "default.nix") (builtins.attrNames entries);
in
builtins.listToAttrs (
  map (dir: {
    name = lib.removeSuffix ".nix" dir;
    value = ./. + "/${dir}";
  }) dirs
)
