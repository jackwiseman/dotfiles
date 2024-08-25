{ stdenvNoCC, lib, ... }:
stdenvNoCC.mkDerivation {
  pname = "monaco-nerd-font";
  version = "0.1";
  src = ../assets;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "Monaco Nerd Font";
    homepage = "github.com";
    platforms = platforms.all;
  };
}
