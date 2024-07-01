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
      ./i3.nix
      ./nvidia.nix
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
    st alacritty kitty neovim git stow tmux starship fzf zsh
    gcc cmake python3 go lua 
    brave obsidian discord surf
    unzip zip wget
    pavucontrol
    xclip
    killall
    mpv
    # steam lutris protonup-qt
    # greetd.tuigreet
  ];

  programs.zsh.enable = true;
  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" ]; })
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

  # services.fail2ban.enable = true;
  # virtualisation.vmware.host.enable = true;  # enable virtualisation

  # sound
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;


  
 }
