{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
    };
    windowManager.dwm = {
      enable = true;
    #   package = pkgs.dwm.overrideAttrs {
    #   src = "$HOME/.sources/dwm";
    #   };
    };
  };

  environment.systemPackages = with pkgs; [
    feh
    libnotify
    dunst
    picom
  ];
}
