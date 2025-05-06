{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Hardware
    nixos-hardware = {
	  url = "github:NixOS/nixos-hardware/master";
    };
    
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      asta = let
	username = "daniel";
	specialArgs = { inherit username; };
      in
	nixpkgs.lib.nixosSystem {
	  inherit specialArgs;
	  system = "x86_64-linux";
	  modules = [
	    nixos-hardware.nixosModules.lenovo-thinkpad-t480
	    ./hosts/asta

	    home-manager.nixosModules.home-manager {
	        home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;

	        home-manager.extraSpecialArgs = inputs // specialArgs;
	        home-manager.users.${username} = import ./users/${username}/home.nix;
	    }
	  ];
	};
    };
  };
}
