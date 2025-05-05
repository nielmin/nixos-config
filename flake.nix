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
    nixosConfigurations.asta = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
	nixos-hardware.nixosModules.lenovo-thinkpad-t480

	# home-manager module
	home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.daniel = import ./home.nix;
	}
      ];
    };
  };
}
