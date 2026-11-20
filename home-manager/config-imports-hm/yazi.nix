{ config, pkgs, ... }:

{
 programs.yazi = {
   enable = true;
   plugins = {
     wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
  };
 };
}
