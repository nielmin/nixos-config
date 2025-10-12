{
  config,
  pkgs,
  ...
}:
{
  flake = {
    meta.users = {
      nuc = {
        name = "NUC";
        username = "nuc";
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
        ];
      };
    };
    modules.nixos.nuc =
      { pkgs, ... }:
      {
        users.users.nuc = {
          description = config.flake.meta.users.nuc.name;
          isNormalUser = true;
          createHome = true;
          group = "nuc";

          extraGroups = [
            "wheel"
            "networkmanager"
          ];

          initialPassword = "changeme";

          openssh.authorizedKeys.keys = config.flake.meta.users.nuc.authorizedKeys;

        };
        users.groups = {
          nuc.gid = 1000;
        };
      };
  };
}
