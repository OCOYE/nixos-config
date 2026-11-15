{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Musics";
    extraConfig = '' # set MPD to use pipewire output
      audio_output {
        type "pipewire"
        name "mpd and rmpc"
      }
    '';

  network.listenAddress = "127.0.0.1";
  network.startWhenNeeded = true;
 };
}
