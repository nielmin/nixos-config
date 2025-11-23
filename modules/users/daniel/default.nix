{
  config,
  pkgs,
  ...
}:
{
  flake.modules.nixos.users =
    { pkgs, ... }:
    {
      programs.fish.enable = true;

      users.users.daniel = {
        description = config.flake.meta.users.daniel.name;
        isNormalUser = true;
        createHome = true;
        group = "daniel";

        extraGroups = [
          "wheel"
          "networkmanager"
        ];

        linger = true;

        autoSubUidGidRange = true;

        initialPassword = "changeme";

        openssh.authorizedKeys.keys = config.flake.meta.users.daniel.authorizedKeys;

        shell = pkgs.fish;
      };
      users.groups = {
        daniel.gid = 1000;
      };
    };
}
