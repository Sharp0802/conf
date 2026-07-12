final: prev:
let
  mkComponent =
    { pname, hash }:
    final.stdenv.mkDerivation {
      inherit pname;
      version = "main";

      src = final.fetchFromGitHub {
        owner = "linux-credentials";
        repo = "oo7";
        rev = "main";
        inherit hash;
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
    hash = prev.lib.fakeHash;
  };
  cargo-credential-oo7 = mkComponent {
    pname = "cargo-credential-oo7";
    hash = prev.lib.fakeHash;
  };
}
