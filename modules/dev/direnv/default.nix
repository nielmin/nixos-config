{
  flake.modules.homeManager.direnv =
    { pkgs, ... }:
    {
      programs.direnv = {
        enable = true;
        enableBashIntegration = true;
        nix-direnv.enable = true;
      };
    };
}
