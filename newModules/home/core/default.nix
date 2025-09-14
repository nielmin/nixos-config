{
  flake.modules.homeManager.core =
    { lib, ... }:
    {
      home = {
        username = lib.mkDefault "daniel";
        homeDirectory = lib.mkDefault "/home/${username}";
      };
    };
}
