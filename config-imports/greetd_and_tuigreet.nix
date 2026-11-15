{ config, libs, pkgs, ... }:

# =====================
#  Greetd and Tuigreet
# =====================

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session"; # Starts Niri after login
        user = "greeter";
      };
    };
  };
}

