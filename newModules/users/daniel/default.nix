{
  config,
  pkgs,
  ...
}:
{
  flake = {
    meta.users = {
      daniel = {
        name = "Daniel Hwang";
        username = "daniel";
      };
    };
    modules.nixos.users =
      {
        pkgs,
        ...
      }:
      {
      users.users.daniel = {
        description = config.flake.meta.users.daniel.name;
        isNormalUser = true;
        createHome = true;
        group = "daniel";

        extraGroups = [
          "wheel"
          "networkmanager"
        ];

        initialPassword = "changeme";

      };
      users.groups = {
         daniel.gid = 1000;
      };
    };
  };
}
