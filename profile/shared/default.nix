{ ... }:
{
  imports = [
    ./boot.nix
    ./firewall.nix
    ./interop.nix
    ./net.nix
    ./polkit.nix
    ./seatd.nix
    ./secret.nix
    ./shell.nix
    ./tz.nix
    ./virt.nix
  ];

  # omit documentations
  documentation = {
    enable = false;
    doc.enable = false;
    info.enable = false;
    man.enable = false;
    nixos.enable = false;
  };

  system.stateVersion = "25.11";
}
