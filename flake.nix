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

    # stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
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
    stylix,
    catppuccin,
    lanzaboote,
    disko,
    agenix,
    ...
  } @ inputs: let
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
    nixosConfigurations = {
      asta = let
        username = "daniel";
        specialArgs = {inherit username catppuccin;};
      in
        nixpkgs.lib.nixosSystem {
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
      nuc = let
        username = "daniel";
        specialArgs = {inherit username;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            catppuccin.nixosModules.catppuccin
            ./hosts/nuc

            home-manager.nixosModules.home-manager
            ({config, ...}: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs // {systemConfig = config;};
              home-manager.users.${username} = import ./users/${username}/home.nix;
            })
          ];
        };
      vm = let
        username = "daniel";
        specialArgs = {inherit username;};
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          modules = [
            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
            ./hosts/vm
            ./users/${username}/nixos.nix
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
