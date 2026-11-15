{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Musics";
    network.listenAddress = "127.0.0.1";
    network.startWhenNeeded = true;
  };
}
