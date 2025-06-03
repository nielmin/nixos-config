{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
    };

    # Lanzaboote
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixOS Hardware
    nixos-hardware = {
	  url = "github:NixOS/nixos-hardware/master";
    };

    # stylix
    stylix = {
	url = "github:danth/stylix";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, stylix, lanzaboote, ... }@inputs: {
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
            stylix.nixosModules.stylix
            lanzaboote.nixosModules.lanzaboote
	    nixos-hardware.nixosModules.lenovo-thinkpad-t480
	    ./hosts/asta

	    home-manager.nixosModules.home-manager
            ({ config, ... }: {
	        home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;

	        home-manager.extraSpecialArgs = inputs // specialArgs // { systemConfig = config; };
	        home-manager.users.${username} = import ./users/${username}/home.nix;
	    })
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

	    home-manager.nixosModules.home-manager
            ({ config, ...}: {
	        home-manager.useGlobalPkgs = true;
	        home-manager.useUserPackages = true;

	        home-manager.extraSpecialArgs = inputs // specialArgs // { systemConfig = config; };
	        home-manager.users.${username} = import ./users/${username}/home.nix;
	    })
	  ];
	};
    };
  };
}
