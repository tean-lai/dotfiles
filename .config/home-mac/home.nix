{ config, pkgs, ... }:

{
  home.username = "tean";
  home.homeDirectory = "/Users/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    
    git
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.neovim.enable = true;
  programs.kitty.enable = true;
}
