{ inputs, ... }:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
  {
    config,
    pkgs,
    system,
    ...
  }:
  {
    treefmt.config = {
      projectRootFile = "flake.nix";
      flakeCheck = true;
      progams = {
        nixfmt.enable = true;
      };
    };
  };
}
