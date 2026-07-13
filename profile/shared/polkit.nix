{ ... }:
{
  security.polkit = {
    enable = true;
    enablePkexecWrapper = true;
  };

  security.soteria.enable = true;
}
