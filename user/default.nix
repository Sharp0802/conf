users:
{ ... }:
{
  imports = map (user: ./. + user) users;
}
