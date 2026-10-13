{ stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "fish-dos-prompt";
  version = "0.1";
  src = ./.;
  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    cp -r functions $out/
  '';
}
