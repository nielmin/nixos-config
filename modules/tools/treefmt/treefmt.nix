{ inputs, ... }:
{
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
        programs = {
          nixfmt.enable = true;
          alejandra.enable = true;
        };
      };
    };
}
