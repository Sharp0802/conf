{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (btop.override {
      cudaSupport = true;
      rocmSupport = true;
    })
    ddcutil
    pciutils
    openssh
    vulkan-tools
    rocmPackages.rocm-smi
  ];
}
