final: _prev:
let
  mkComponent =
    { pname }:
    final.rustPlatform.buildRustPackage {
      inherit pname;
      version = "main";

      src = final.fetchFromGitHub {
        owner = "linux-credentials";
        repo = "oo7";
        rev = "main";
        hash = "sha256-AIvGbfmN0fUsm63kFO8WETUmuR1YTWLwMKuaxRL7eho=";
      };

      cargoHash = "sha256-UFExipKWK0BSBbQTDT5h09XyeH4NIeWVjlUpS4SNvdA=";

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
  git-credential-oo7 = mkComponent {
    pname = "git-credential-oo7";
  };
  cargo-credential-oo7 = mkComponent {
    pname = "cargo-credential-oo7";
  };
}
