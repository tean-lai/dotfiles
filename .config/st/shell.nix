{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.xorg.libX11
    pkgs.xorg.libXft
    pkgs.xorg.libXinerama
    pkgs.freetype
    pkgs.fontconfig
    pkgs.gcc
    pkgs.pkg-config
  ];

  shellHook = ''
    export PKG_CONFIG_PATH="${pkgs.xorg.libX11.dev}/lib/pkgconfig:${pkgs.xorg.libXft.dev}/lib/pkgconfig:${pkgs.xorg.libXinerama.dev}/lib/pkgconfig:${pkgs.freetype.dev}/lib/pkgconfig:${pkgs.fontconfig.dev}/lib/pkgconfig"
    export PATH=${pkgs.gcc}/bin:${pkgs.pkg-config}/bin:$PATH
  '';
}
