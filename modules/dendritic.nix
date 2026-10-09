{ inputs, ... }: {
  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    nixpkgs.url = "https://nixos.org/channels/nixos-unstable/nixexprs.tar.zst";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  imports = [
    (inputs.flake-file.flakeModules.dendritic or { })
  ];
}
