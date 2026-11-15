{ config, pkgs, ... }:

# GIT

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
}
