apps:
{ ... }:
{
  imports = map (app: ./. + "${app}.nix") apps;
}
