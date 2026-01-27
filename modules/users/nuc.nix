{
  config,
  pkgs,
  ...
}:
{
  flake.modules.nixos.nuc =
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
}
