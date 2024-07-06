{ config, pkgs, ... }:

{
  home.username = "tean";
  home.homeDirectory = "/home/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    river rofi-wayland swaybg libnotify wlr-randr mako
    tmux starship 
    fzf gh
    obsidian discord
    pavucontrol
    wl-clipboard
    blueberry bluetuith
    font-manager
    lynx ladybird
  ];

  programs.foot = {
    enable = true;
    settings = {
      main.font = "JetBrainsMono Nerd Font:size=12";
      mouse.hide-when-typing = "yes";
    };
  };


  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };

  programs.lf.enable = true;  # 

  programs.pywal.enable = false;

  programs.spotify-player = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = false;
    };
  };

  home.file = {
    ".config/river/init".source = ../river/init;
  };


  # gtk = {
  #   enable = true;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   iconTheme.name = "GruvboxPlus";
  # };

}
