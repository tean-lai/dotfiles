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
      fonts = [ "JetBrainsMono" "Hermit" "FiraCode" "ComicShannsMono" "Mononoki" ];
    })
    taplo pylint python312Packages.python-lsp-server marksman nil #lsp
    kakoune vis
    calcurse
    lf
  ];

  programs = {
    # alacritty git gpg helix zsh

    alacritty = {
      enable = true;
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
      enable = true;
    };



  };



  programs.home-manager.enable = true;

}
