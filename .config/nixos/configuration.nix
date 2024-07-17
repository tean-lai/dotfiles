# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      # ./boot.nix
      ./localization.nix
      # ./i3.nix
      # ./dwm.nix
      # ./nvidia.nix
      # ./sound.nix
      # ./terminal-emulator.nix
      # ./river.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  system.stateVersion = "24.05";
  nixpkgs.config.allowUnfree = true;
 networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager = {
      xterm.enable = false;
    };

    displayManager.lightdm.enable = false;

    windowManager.i3 = {
      enable = true;
    };

    xkb = {
      layout = "us";
      variant = "";
    };
    
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%A | %b %d | %I:%M %p' --cmd Hyprland";
        user = "greeter";
      };
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";


  hardware = {
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
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "555.42.02";
        sha256_64bit = "sha256-k7cI3ZDlKp4mT46jMkLaIrc2YUx1lh1wj/J4SVSHWyk=";
        sha256_aarch64 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        openSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        settingsSha256 = "sha256-rtDxQjClJ+gyrCLvdZlT56YyHQ4sbaL+d5tL4L4VfkA=";
        persistencedSha256 = lib.fakeSha256;
      };
    };
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
    neovim git tmux starship fzf zsh
    gcc cmake python3 go lua
    unzip zip wget
    home-manager 
    pinentry-curses
    greetd.tuigreet
  ];

  programs = {
    zsh.enable = true;

    nix-ld = {
      enable = true;
      libraries = [ pkgs.xorg.libX11 ];
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      # gamemode.enable = true;
    };

    gamemode.enable = true;

    gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };

    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  
  # security.polkit.enable = true;
  hardware = {
    # cpu.amd.updateMicrocode = true;  # security?
    bluetooth.enable = true;
  };

  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # xdg.portal.config.common.default = "*";

  # services.fail2ban.enable = true;
  # virtualisation.vmware.host.enable = true;  # enable virtualisation

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
