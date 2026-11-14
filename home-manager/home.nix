{ config, pkgs, ... }:

{
  programs.git = {
  enable = true;
  userName = "Manoel Rezende";
  userEmail = "manoelrezende70@proton.me";
};
  programs.firefox.enable = true;
  home.packages = with pkgs; [
    neovim
    alacritty
    fuzzel
    pavucontrol
    wget
    waybar
    swaybg    
  ];
  home.file."Pictures/Wallpapers".source = ./wallpapers; 
  xdg.configFile = {
    "niri/config.kdl".source = ./dotfiles/niri/config.kdl; # Niri dotfiles
    "fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel/fuzzel.ini;
    "waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc;
    "waybar/style.css".source = ./dotfiles/waybar/style.css;
  };
  home.stateVersion = "26.05";
}
  
