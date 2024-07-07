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
    # texliveFull 
    spotify-player
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

    gpg = {
      enable = true;
    };

    helix = {
      defaultEditor = true;
      enable = true;
    };


  };

  home.file = {
    ".config/kitty/kitty.conf".source = ../.config/kitty/kitty.conf;
    ".config/helix" = {
      source = ../.config/helix;
      recursive = true;
    };
  };

  home.sessionVariables = { EDITOR = "hx"; };

  programs.home-manager.enable = true;


}
