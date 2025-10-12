{
  config,
  pkgs,
  ...
}:
{
  flake = {
    meta.users = {
      tv = {
        name = "TV";
        username = "tv";
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
        ];
      };
    };
    modules.nixos.users =
      { pkgs, ... }:
      {
        users.users.tv = {
          description = config.flake.meta.users.tv.name;
          isNormalUser = true;
          createHome = true;
          group = "tv";

          extraGroups = [
            "wheel"
            "networkmanager"
          ];

          initialPassword = "changeme";

          openssh.authorizedKeys.keys = config.flake.meta.users.tv.authorizedKeys;

        };
        users.groups = {
          tv.gid = 1000;
        };
      };
  };
}
