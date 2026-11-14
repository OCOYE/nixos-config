{ config, lib, pkgs, inputs, myuser, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # ====================
  #      BootLoader
  # ====================
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true; # My laptop have problems without this :3
  boot.loader.grub.device = "nodev";
  boot.kernelPackages = pkgs.linuxPackages_latest; # Lastest kernel bro!!!!

  networking.hostName = "nixos"; # My hostname

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Network Manager
  networking.networkmanager.enable = true;

  # My TimeZone
  time.timeZone = "America/Recife";

  # ====================
  #       Printer
  # ====================
 services.printing = {
   enable = true;
   drivers = [
     pkgs.epson-escpr # To my Epson L3150
     pkgs.epson-escpr2 # To my Epson L3150
   ];
 };

  # ====================
  #        Sound
  # ====================
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
  services.flatpak.enable = true; # Flatpak
  programs.gamemode.enable = true; # Gamemode

  # Environment Packages
   environment.systemPackages = with pkgs; [
     # Global Packages
     system-config-printer
     xdg-desktop-portal-gtk
     xdg-desktop-portal-gnome
     oo7-portal
     gnome-control-center
     tuigreet
   ];
 
  # Greetd and Tuigreet Configs
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  # ====================
  #        Fonts
  # ====================
  fonts.packages = with pkgs; [
    font-awesome
  ];
  system.stateVersion = "26.05";

}

