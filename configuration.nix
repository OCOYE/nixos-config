{ config, lib, pkgs, inputs, myuser, myhostname, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix # HARDWARE
      ./config-imports/flatpak.nix # flatpak-nix and flatpaks
      ./config-imports/printer_EPSONL3150.nix # Configuration to my EpsonL3150 works
      ./config-imports/sound.nix # To sound works (pipewire)
      ./config-imports/fonts.nix # Fonts to my system
      ./config-imports/greetd_and_tuigreet.nix # Login system TUI (greetd + tuigreet)
    ];

  # ====================
  #      BootLoader
  # ====================
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true; # My laptop have problems without this :3
  boot.loader.grub.device = "nodev";
  boot.kernelPackages = pkgs.linuxPackages_latest; # Lastest kernel bro!!!!

  networking.hostName = "${myhostname}"; # My hostname

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network Manager
  networking.networkmanager.enable = true;

  # My TimeZone
  time.timeZone = "America/Recife";

  # My user.
   users.users.${myuser} = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
       tree
     ];
   };

  # ====================
  #       Packages
  # ====================
  # Services

  programs.niri.enable = true; # WM
  programs.gamemode.enable = true; # Gamemode

  # Environment Packages
   environment.systemPackages = with pkgs; [
     # Global Packages
     system-config-printer # For my printer works
     xdg-desktop-portal-gtk # For screenshare works
     xdg-desktop-portal-gnome # For "save file location" box
     oo7-portal # For keyring permission acess
     gnome-control-center # For xdg gnome and gtk applications works
     tuigreet # For greetd
   ];

  system.stateVersion = "26.05";

}

