{ config, pkgs, ... }:

{
  home.username = "tean";
  # home.homeDirectory = "/home/tean";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    tmux
    kitty
    fzf
    # ladybird
    (nerdfonts.override {
      fonts = [ "JetBrainsMono" "Hermit" "FiraCode" "ComicShannsMono" ];
    })
  ];

  programs = {
    # alacritty fish git helix spotify-player zsh
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

    fish = { enable = true; };

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
      ignores = [ ".build" "!.gitignore" ];
      languages.language = [{
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt-rfc-style";
      }];
      settings = {
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        theme = "base16_default";
      };
    };

    spotify-player.enable = true;

    zsh = { enable = true; };

  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim" = {
      source = ../.config/nvim;
      recursive = true;
    };
    # "/.config/.tmux.conf".source = ../.tmux.conf;
    # ".config/user-dirs.dirs".source = ../user-dirs.dirs;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = { EDITOR = "hx"; };

  programs.home-manager.enable = true;

}
