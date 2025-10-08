{
  flake.modules.homeManager.yazi =
    { config, ... }:
    {
      programs.yazi = {
        enable = true;
      };
    };  
}
