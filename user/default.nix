users:
{ ... }:
{
  imports = map (user: ./. + "${user}.nix") users;
}
