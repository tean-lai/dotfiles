{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    alacritty kitty
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "LukeSmithxyz";
        repo = "st";
        rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
        sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
      };
      # Make sure you include whatever dependencies the fork needs to build properly!
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))

    
      # If you want it to be always up to date use fetchTarball instead of fetchFromGitHub
  # src = builtins.fetchTarball {
  #   url = "https://github.com/lukesmithxyz/st/archive/master.tar.gz";
  # };
    
    # (st.overrideAttrs (oldAttrs: rec {
    #   configFile = writeText "config.def.h" (builtins.readFile ../st/config.h);
    #   postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    #}))
  ];

  # services.xserver.displayManager.sessionCommands = ''
  #   ${pkgs.xorg.xrdb}/bin/xrdb -merge <${pkgs.writeText "Xresources" ''
  #     Xcursor.theme: Adwaita
  #     Xcursor.size: 200
  #  ''}
  # '';


}
