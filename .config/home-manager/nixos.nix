{ config, pkgs, ... }:

{
  home.username = "tean";
  home.homeDirectory = "/home/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    # river rofi-wayland swaybg libnotify wlr-randr waybar #  mako # wayland
    waybar hyprpaper libnotify dunst rofi-wayland egl-wayland mangohud wl-clipboard
    dunst libnotify feh dmenu polybar xclip
    foot
    brave
    starship
    obsidian discord
    pavucontrol
    blueberry bluetuith
    font-manager
    pinentry-curses 
    vlc
    osu-lazer
  ];

  programs = {
    lf.enable = true;
    pywal.enable = true;
  };

  home.file = {
    # ".config/river/init".source = ../.config/river/init;
    # ".config/i3/config".source = ../.config/i3/config;
    # ".config/polybar" = { source = ../.config/polybar; recursive = true; };
  };


  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

}
