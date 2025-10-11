{
  flake.modules.homeManager.core =
    { config, ... }:
    {
      programs.yazi = {
        enable = true;
      };
    };
}
