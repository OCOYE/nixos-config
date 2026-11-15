{ config, lib, pkgs, inputs, myuser, myhostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./config-imports/flatpak.nix
      ./config-imports/printer_EPSONL3150.nix
      ./config-imports/sound.nix
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

