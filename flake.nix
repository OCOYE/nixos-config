{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, nixpkgs-unstable, ... }@inputs:

  let
    # pkgs-unstable
    system = "x86_64-linux";
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true; # Accept NonFree softwares in pkgs-unstable
    };
    # User
    myuser = "ocoye";
    myhostname = "ocoyeNIXOS";
  in

  {  
    # Please replace my-nixos with your hostname
    nixosConfigurations.${myhostname} = nixpkgs.lib.nixosSystem {
    
      specialArgs = { inherit inputs myuser myhostname pkgs-unstable; };

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
         
        nix-flatpak.nixosModules.nix-flatpak
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
