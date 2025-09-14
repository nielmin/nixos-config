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

    # flake-parts
    flake-parts.url = "github:hercules-ci/flake-parts";

    # import-tree
    import-tree.url = "github:vic/import-tree";
  };

  outputs =
  { ... }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
