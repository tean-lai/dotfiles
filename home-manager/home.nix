{ config, pkgs, ... }:

{
  home.username = "tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    tmux
    kitty
    yt-dlp # mpv (requires swift for whatever reason)
    fzf
    pass
    uutils-coreutils-noprefix  # rust core utils 
    newsboat
    # texliveFull 
    spotify-player
    syncthing
    mplayer
    ncmpcpp mpd
    (nerdfonts.override {
      fonts = [ "JetBrainsMono" "Hermit" "FiraCode" "ComicShannsMono" ];
    })

  ];

  programs = {
    # alacritty git gpg helix zsh

    alacritty = {
      enable = true;
      settings = {
        cursor.style = "Block";
        window = {
          opacity = 0.9;
          padding = {
            x = 10;
            y = 10;
          };
        };
      };
    };

    git = {
      enable = true;
      userName = "Tean Lai";
      userEmail = "laitean19@gmail.com";
      aliases = {
        pu = "push";
        co = "checkout";
        cm = "commit";
      };
    };

    helix = {
      defaultEditor = true;
      enable = true;
    };

    lf.enable = true;


  };

  home.file = {
    # ".config/kitty" = { source = ../.config/kitty; recursive = true; };
    # ".config/helix" = {
    #   source = ../.config/helix;
    #   recursive = true;
    # };
    ".zshrc".source = ../.zshrc;
  };

  home.sessionVariables = { EDITOR = "hx"; };

  programs.home-manager.enable = true;


}
