{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [ 
    python3
    vscode
    emacs ripgrep coreutils fd git clang
    sqlite
  ];

  home.file = { };

  programs = {
    gpg = {
      enable = true;
    };
  };

}
