{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Musics";     

    extraConfig = ''
      audio_output {
        type "pipewire"
        name "mpd with rmpc output"
      }
    '';
    network.listenAddress = "any";
    network.startWhenNeeded = true;
};
}
