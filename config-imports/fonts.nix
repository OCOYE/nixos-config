{ config, lib, pkgs, ... }:

# ====================
#        Fonts
# ====================

{
   fonts.packages = with pkgs; [
    font-awesome
  ];
}
