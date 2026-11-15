{ config, pkgs, pkgs-unstable, ... }:


# Git
{
  programs.git = {
  enable = true;
  settings = {
    user = {
      name = "Manoel Rezende";
      email = "manoelrezende70@proton.me";
    };
  };
};

# ====================
#         Home
# ====================

  programs.firefox = {
    enable = true;
    package = pkgs-unstable.firefox;
  };

  home.packages = with pkgs; [
    neovim
    alacritty
    fuzzel
    pavucontrol
    wget
    waybar
    swaybg
    mpv
    imv
    pcmanfm    
  ];

# =====================
# Files and Directories
# =====================

  home.file."Pictures/Wallpapers".source = ./wallpapers; 
  xdg.configFile = {
    "niri/config.kdl".source = ./dotfiles/niri/config.kdl; # Niri dotfiles
    "fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel/fuzzel.ini; # Fuzzel dotfiles
    "waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc; # Waybar dotfiles (config.jsonc)
    "waybar/style.css".source = ./dotfiles/waybar/style.css; # Waybar dotfiles (style.css)
  };
  home.stateVersion = "26.05"; # Version
}
  
