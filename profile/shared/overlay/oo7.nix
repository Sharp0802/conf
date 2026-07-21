final: prev:
let
  version = "0.7.0-alpha";
  hash = "sha256-JshJPQgV8+LgKPflpxE9r8uwsDap9EWR/Z5sGY0sEao=";
  cargoHash = "sha256-IPDOdCJuSJiNCWaAPGV6c9WcvIaQITmtEPfB+lza8ro=";

  src = final.fetchFromGitHub {
    owner = "linux-credentials";
    repo = "oo7";
    rev = "0.7.0.alpha";
    inherit hash;
  };

  cargoDeps = final.rustPlatform.fetchCargoVendor {
    inherit src;
    hash = cargoHash;
  };

  oo7 = prev.oo7.overrideAttrs (_old: {
    inherit version src cargoDeps;
  });

  mkComponent =
    { pname }:
    final.rustPlatform.buildRustPackage {
      inherit pname version src cargoHash;

      RUSTFLAGS = "-C target-cpu=native";
      CARGO_PROFILE_RELEASE_LTO = "true";

      cargoBuildFlags = [ "-p=${pname}" ];
      doCheck = false;

      installPhase = ''
        runHook preInstall
        mkdir -p $out/bin
        cp target/${final.stdenv.hostPlatform.rust.rustcTarget}/release/${pname} $out/bin
        runHook postInstall
      '';
    };
in
{
  inherit oo7;

  oo7-pam = prev.oo7-pam.override {
    inherit oo7;
  };
  oo7-server = prev.oo7-server.override {
    inherit oo7;
  };
  oo7-portal = prev.oo7-portal.override {
    inherit oo7;
  };

  git-credential-oo7 = mkComponent {
    pname = "git-credential-oo7";
  };
  cargo-credential-oo7 = mkComponent {
    pname = "cargo-credential-oo7";
  };
}
