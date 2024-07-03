# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./boot.nix
      ./localization.nix
      # ./i3.nix
      ./dwm.nix
      ./nvidia.nix
      ./sound.nix
      ./terminal-emulator.nix
      ./river.nix
    ];

  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.tean = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Tean";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  environment.systemPackages = with pkgs; [
    # gnome.gnome-disk-utility
    neovim git stow tmux starship fzf zsh
    neofetch
    gcc cmake python3 go lua gnumake
    brave obsidian discord spotify
    unzip zip wget
    pavucontrol blueberry
    xclip
    killall
    mpv
    lf
    # lutris protonup-qt
  ];

  programs.zsh.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    xorg.libX11
  ];
  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" "JetBrainsMono" ]; })
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  
  # security.polkit.enable = true;
  hardware = {
    # cpu.amd.updateMicrocode = true;  # security?
    bluetooth.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  # services.fail2ban.enable = true;
  # virtualisation.vmware.host.enable = true;  # enable virtualisation

  
 }
