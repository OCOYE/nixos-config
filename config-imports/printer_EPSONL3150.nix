{ config, lib, pkgs, ... }:
# ====================
#       Printer
# ====================

{
 services.printing = {
   enable = true; # enables printing
   drivers = [
     pkgs.epson-escpr # To my Epson L3150
     pkgs.epson-escpr2 # To my Epson L3150
   ];
 };
}
