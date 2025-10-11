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
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOo7qey0S5P0GgHBTGdZomCHq3zs6M43a/U5K/CwFGrq daniel@vm"
        ];
      };
    };
    modules.nixos.users =
      { pkgs, ... }:
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

          openssh.authorizedKeys.keys = config.flake.meta.users.daniel.authorizedKeys;

          shell = pkgs.fish;
        };
        users.groups = {
          daniel.gid = 1000;
        };
      };
  };
}
