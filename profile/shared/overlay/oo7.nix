final: prev:
let
  mkComponent =
    { pname }:
    final.stdenv.mkDerivation {
      inherit pname;
      version = "main";

      src = final.fetchFromGitHub {
        owner = "linux-credentials";
        repo = "oo7";
        rev = "main";
        hash = "sha256-AIvGbfmN0fUsm63kFO8WETUmuR1YTWLwMKuaxRL7eho=";
      };

      nativeBuildInputs = with prev; [
        cargo
        rustc
      ];

      RUSTFLAGS = "-C target-cpu=native -C lto";

      buildPhase = ''
        runHook preBuild
        cargo build -p ${pname} --release
        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/bin
        cp target/release/${pname} $out/bin
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
