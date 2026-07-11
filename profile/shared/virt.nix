{ ... }:
{
  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        # for podman compose
        dns_enabled = true;
      };
    };
  };
}
