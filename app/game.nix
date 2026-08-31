{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (symlinkJoin {
      name = "prismlauncher-opencl";
      paths = [ prismlauncher ];
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/prismlauncher \
          --prefix LD_LIBRARY_PATH : "${pkgs.lib.makeLibraryPath [ pkgs.ocl-icd ]}:/run/opengl-driver/lib" \
          --set OCL_ICD_VENDORS /run/opengl-driver/etc/OpenCL/vendors
      '';
    })
    r2modman
  ];

  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };
}
