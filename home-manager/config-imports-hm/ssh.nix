{ config, pkgs, ... }:

{
  programs.ssh = {
    extraConfig = ''
      Host myhost
        Hostname 192.168.1.123
        Port 22
        User user
    '';
  };
}
