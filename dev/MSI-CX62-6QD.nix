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
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
  
  services.udev.extraRules = ''
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", KERNELS="0000:00:02.0", SYMLINK+="dri/wlr-1"
    SUBSYSTEM=="drm", KERNEL=="card[0-9]*", KERNELS="0000:01:00.0", SYMLINK+="dri/wlr-2"
  '';

  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/wlr-1:/dev/dri/wlr-2";
  };

  services.xserver.videoDrivers = [
    "intel"
    "nvidia"
  ];
}
