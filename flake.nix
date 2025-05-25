{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager = {
	  url = "github:nix-community/home-manager/release-25.05";
	  inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Hardware
    nixos-hardware = {
	  url = "github:NixOS/nixos-hardware/master";
    };
    
    # NVF
    nvf = {
	  url = "github:notashelf/nvf";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, nvf, ... }@inputs: {
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
      nuc = let
	username = "daniel";
	specialArgs = { inherit username; };
      in
	nixpkgs.lib.nixosSystem {
	  inherit specialArgs;
	  system = "x86_64-linux";
	  modules = [
	    ./hosts/nuc

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
