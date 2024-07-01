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
    ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;  # use the latest stable kernel
  # boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" ];
  # boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  system.stateVersion = "24.05";

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  # networking.firewall.enable = true;

  time.timeZone = "America/New_York";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tean = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Tean";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    waybar hyprpaper libnotify dunst rofi-wayland egl-wayland neofetch blueberry mangohud # gnome.gnome-disk-utility
    alacritty kitty neovim git stow tmux starship fzf zsh
    gcc cmake python3 go lua 
    brave obsidian discord
    unzip zip wget
    # steam lutris protonup-qt
    # greetd.tuigreet
  ];

  programs.zsh.enable = true;
  
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hermit" ]; })
  ];
 
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.variables = {
    # LIBVA_DRIVER_NAME = "nvidia";
    # XDG_SESSION_TYPE = "wayland";
    # GBM_BACKEND = "nvidia-drm";
    # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # NVD_BACKEND = "direct" # good for electron?
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # security.polkit.enable = true;
  hardware = {
    # cpu.amd.updateMicrocode = true;  # security?

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = true;
      # package = pkgs.linuxPackages_latest.nvidiaPackages.stable;
    };

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
    displayManager.lightdm.enable = false;
    # displayManager.gdm.enable = true;
    # displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;
    # desktopManager.gnome.enable = true;
  };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a dot %h | %F' --cmd Hyprland";
  #       user = "greeter";
  #     };
  #   };
  # };


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
