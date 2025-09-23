{
  flake.modules.homeManager.dev =
  { pkgs, ... }:
  {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
