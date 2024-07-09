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
    protonvpn-cli_2 python3 python311Packages.pythondialog python311Packages.pip openvpn qbittorrent-qt5 soulseekqt nicotine-plus
  ];

  programs = {
    lf.enable = true;
    pywal.enable = true;
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
