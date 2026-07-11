final: prev:
let
  configH = ./config.h;
  newAttrs = old: {
    nativeBuildInputs = old.nativeBuildInputs or [ ];
    buildInputs = (old.buildInputs or [ ]) ++ [
      prev.fcft
      prev.pixman
      prev.libdrm
    ];
    patches = [
      ./bar.patch
    ];

    NIX_CFLAGS_COMPILE = (old.NIX_CFLAGS_COMPILE or "") + " -Wno-unused-function";
  };
in
{
  dwl =
    (prev.dwl.override {
      inherit configH;
    }).overrideAttrs
      newAttrs;
}
