{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    river
    waybar
    hyprpaper
    libnotify
    dunst
    rofi-wayland
    egl-wayland
    mangohud
    foot
    greetd.tuigreet
  ];

  services.xserver = {
    displayManager.lightdm.enable = false;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%A | %b %d | %I:%M %p' --cmd river";
        user = "greeter";
      };
    };
  };


}
