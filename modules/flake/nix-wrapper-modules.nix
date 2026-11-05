{ inputs, ... }: {
  flake-file.inputs.nix-wrapper-modules = {
    url = "github:nix-community/nix-wrapper-modules";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  imports = [ inputs.nix-wrapper-modules.flakeModules.wrappers ];
}
