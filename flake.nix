{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05-small";

    # disko
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # treefmt-nix
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
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

    # flake-parts
    flake-parts.url = "github:hercules-ci/flake-parts";

    # import-tree
    import-tree.url = "github:vic/import-tree";

    # devshell
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # niri-flake
    niri-flake = {
      url = "github:sodiboo/niri-flake";
    };
    
    # nixos-facter-modules
    nixos-facter-modules = {
      url = "github:numtide/nixos-facter-modules";
    };
  };

  outputs =
  { ... }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./newModules);
}
