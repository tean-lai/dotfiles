{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    alacritty kitty
    (st.overrideAttrs (oldAttrs: rec {
      configFile = writeText "config.def.h" (builtins.readFile ../st/config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))
  ];

}
