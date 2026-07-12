{ ... }:
{
  imports = [
    ../shared

    ./sshd.nix
  ];

  # no sleep
  systemd.sleep.settings = {
    Sleep = {
      AllowHibernation = "no";
      AllowHybridSleep = "no";
      AllowSuspend = "no";
      AllowSuspendThenHibernate = "no";
    };
  };
}
