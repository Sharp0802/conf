{ lib, ... }:
let
  entries = builtins.readDir ./.;
  files = builtins.filter (file: file != "default.nix") (builtins.attrNames entries);
in
builtins.listToAttrs (
  map (file: {
    name = lib.removeSuffix ".nix" file;
    value = ./. + "/${file}";
  }) files
)
