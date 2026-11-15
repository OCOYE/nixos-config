{
  description = "A simple NixOS flake";

  # ====================
  #       Inputs
  # ====================

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05"; # nixos stable (principal)
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # nixos unstable
    nix-flatpak.url = "github:gmodena/nix-flatpak"; # nix-flatpak

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05"; # home-manager nixos stable (principal)
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  # ====================
  #       Outputs
  # ====================

  outputs = { self, nixpkgs, home-manager, nix-flatpak, nixpkgs-unstable, ... }@inputs:

  # ====================
  #         Var
  # ====================

  let 
    # SYSTEM 
    system = "x86_64-linux";
    # PKGS-UNSTABLE
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true; # Accept NonFree softwares in pkgs-unstable
    };
    # USER
    myuser = "ocoye";
    myhostname = "ocoyeNIXOS";
  in

  {  
    nixosConfigurations.${myhostname} = nixpkgs.lib.nixosSystem {
      # specialArgs
      specialArgs = { inherit inputs myuser myhostname pkgs-unstable; };
       
      # ====================
      #       Modules
      # ====================

      modules = [
        ./configuration.nix # send configs
         
        nix-flatpak.nixosModules.nix-flatpak
        # HOME-MANAGER
        home-manager.nixosModules.home-manager

        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs pkgs-unstable; }; # Add pkgs-unstable to home-manager
          home-manager.users.${myuser} = ./home-manager/home.nix;
        }
      ];
    };
  };
}
