{ inputs, ... }:
{
  flake-file.inputs.devshell = {
    url = "github:numtide/devshell";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  imports = [
    inputs.devshell.flakeModule
  ];
}
