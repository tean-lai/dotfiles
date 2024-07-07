{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [ xquartz ];

  home.file = { };

  programs = {
    gpg = {
      enable = true;
    };
  };

}
