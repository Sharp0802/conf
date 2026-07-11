{ ... }:
{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = false;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:0:2";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/by-path/pci-0000:00:02.0-card";
  };

  services.xserver.videoDrivers = [
    "intel"
    "nvidia"
  ];
}
