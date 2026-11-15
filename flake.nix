{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak , ... }@inputs:
  let
    myuser = "ocoye";
    myhostname = "ocoyeNIXOS";
  in
  {  
    # Please replace my-nixos with your hostname
    nixosConfigurations.${myhostname} = nixpkgs.lib.nixosSystem {
    
      specialArgs = { inherit inputs myuser myhostname; };

      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
         
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${myuser} = ./home-manager/home.nix;

        }
      ];
    };
  };
}
