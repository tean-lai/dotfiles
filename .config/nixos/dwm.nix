{ pkgs, ... }:

{
  services.xserver.windowManager.wdm.enable = true;

  environment.systemPackages = with pkgs; [
    dwm
  ];
}
