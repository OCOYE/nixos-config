{ config, lib, pkgs, ... }:

{
  services.flatpak.enable = true; # Flatpak
  services.flatpak.packages = [
    "org.vinegarhq.Sober" # Sober (or Roblox)
    "com.discordapp.Discord" # Discord
  ];
}
