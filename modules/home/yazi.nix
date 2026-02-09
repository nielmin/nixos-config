{
  flake.homeModules.yazi =
    { config, ... }:
    {
      programs.yazi = {
        enable = true;
      };
    };
}
