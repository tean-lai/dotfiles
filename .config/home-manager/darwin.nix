{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # python312
    # python312Packages.conda
    # python312Packages.matplotlib
    # python312Packages.numpy
    nodejs_22
    vscode
    emacs ripgrep coreutils fd git clang
    neovim
    ueberzug
    imagemagick # (for .svg previews)
    ffmpeg # (for video file thumbnails)
    # gs # (for pdf previews)
    dvtm abduco
    yazi
    go gopls
    spotifyd
    # ocaml opam
    zathura
  ];
home.file = { };

  programs = {
    gpg = {
      enable = true;
    };
  };

}
