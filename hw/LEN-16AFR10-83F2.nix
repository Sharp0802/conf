{ ... }:
{
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = true;
    modesetting = {
      enable = true;
    };
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:7:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/by-path/pci-0000:07:00.0-card";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
}
