final: prev: {
  hahmlet = final.stdenv.mkDerivation {
    pname = "hahmlet";
    version = "master";
    src = final.fetchFromGitHub {
      owner = "hyper-type";
      repo = "hahmlet";
      rev = "master";
      hash = "sha256-ADRcTokQ9BnwiCaCxa2KeEUzKQGq39Zjdl8AA1cSStY=";
    };
    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/fonts/truetype
      find fonts -name "*.ttf" -exec cp {} $out/share/fonts/truetype \;
      runHook postInstall
    '';
  };
}
