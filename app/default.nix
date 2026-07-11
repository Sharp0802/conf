apps:
{ ... }:
{
  imports = map (app: ./. + app) apps;
}
