{ config, pkgs, ... }:

{
  home.homeDirectory = "/Users/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "Hermit" "FiraCode" "ComicShannsMono" ]; })
  ];


  home.file = {
  };


}
