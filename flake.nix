{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # disko
    disko = {
      url = "github:nix-community/disko";
    };

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

    # catppuccin
    catppuccin = {
      url = "github:catppuccin/nix";
    };

    # agenix
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    catppuccin,
    lanzaboote,
    disko,
    agenix,
    ...
  } @ inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.11";
      username = "daniel";
      specialArgs = {inherit username catppuccin;};

      libx = import ./lib/helpers.nix {
        inherit
          self
          inputs
          outputs
          stateVersion
          username
          ;
      };

    allSystems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];

    forAllSystems = f:
      nixpkgs.lib.genAttrs allSystems (system:
        f {
          pkgs = import nixpkgs {inherit system;};
        });
  in {
    homeConfigurations = {
      "${username}@vm" = libx.mkHome {
        hostname = "vm";
      };
    };

    nixosConfigurations = {
      vm = libx.mkHost {
        hostname = "vm";
      };

      nuc = libx.mkHost {
        hostname = "nuc";
      };

      asta = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          catppuccin.nixosModules.catppuccin
          lanzaboote.nixosModules.lanzaboote
          nixos-hardware.nixosModules.lenovo-thinkpad-t480
          disko.nixosModules.disko
          agenix.nixosModules.default
          ./hosts/asta
          ./users/${username}/nixos.nix

          home-manager.nixosModules.home-manager
          ({config, ...}: {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs // {systemConfig = config;};
            home-manager.users.${username} = import ./users/${username}/home.nix;
          })
        ];
      };
    };

    devShells = forAllSystems ({pkgs}: {
      default = pkgs.mkShell {
        packages = with pkgs; [
          jujutsu
          alejandra
        ];
      };
    });

    formatter = forAllSystems ({pkgs}: pkgs.alejandra);
  };
}
