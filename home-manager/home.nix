{ config, pkgs, pkgs-unstable, ... }:


# Git
{
  imports = [
    ./config-imports-hm/git.nix
    ./config-imports-hm/mpd.nix    
  ];

# ====================
#         Home
# ====================

  programs.firefox = {
    enable = true;
    package = pkgs-unstable.firefox;
  };
  
  programs.yt-dlp = {
    enable = true;
    package = pkgs-unstable.yt-dlp;
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
    fastfetch
    rmpc
    mpc    
  ];

# =====================
# Files and Directories
# =====================

  # ~
  home.file = {
    "Pictures/Wallpapers".source = ./wallpapers; # Wallpapers
    ".bashrc".source = ./dotfiles/bashrc/.bashrc; # bashrc config (to fastfetch)
    "Musics".source = ./musics; # My musics
  };

  # ~/.config/
  xdg.configFile = {
    "niri/config.kdl".source = ./dotfiles/niri/config.kdl; # Niri dotfiles
    "fuzzel/fuzzel.ini".source = ./dotfiles/fuzzel/fuzzel.ini; # Fuzzel dotfiles
    "waybar/config.jsonc".source = ./dotfiles/waybar/config.jsonc; # Waybar dotfiles (config.jsonc)
    "waybar/style.css".source = ./dotfiles/waybar/style.css; # Waybar dotfiles (style.css)
    "rmpc/config.ron".source = ./dotfiles/rmpc/config.ron; # rmpc + mpd player
  };
  home.stateVersion = "26.05"; # Version
}
  
