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
      amdgpuBusId = "PCI:7@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", KERNELS=="0000:07:00.0", SYMLINK+="dri/wlr-1"
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", KERNELS=="0000:01:00.0", SYMLINK+="dri/wlr-2"
  '';

  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/wlr-1:/dev/dri/wlr-2";
  };

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];
}
