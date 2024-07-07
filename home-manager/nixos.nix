{ config, pkgs, ... }:

{
  home.username = "tean";
  home.homeDirectory = "/home/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    river rofi-wayland swaybg libnotify wlr-randr #  mako # wayland
    dunst libnotify feh dmenu polybar xclip
    brave
    starship
    obsidian discord
    pavucontrol
    wl-clipboard
    blueberry bluetuith
    font-manager
    lynx 
    pinentry-curses 
  ];

  programs.lf.enable = true;  # 

  programs.pywal.enable = false;

  programs.spotify-player = {
    enable = true;
  };

  home.file = {
    ".config/river/init".source = ../.config/river/init;
    ".config/i3/config".source = ../.config/i3/config;
    ".config/polybar" = { source = ../.config/polybar; recursive = true; };
  };


  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

}
