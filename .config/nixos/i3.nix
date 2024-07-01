{ config, pkgs, callPackage, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    displayManager = {
      lightdm.enable = true;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
      ];
    };
  };
  services.displayManager.defaultSession = "xfce+i3";

  environment.systemPackages = with pkgs; [
    polybar
    feh
    libnotify
    dunst
    rofi
    blueberry
    xclip
    picom
  ];

}
