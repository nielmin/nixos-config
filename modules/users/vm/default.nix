{ config, ... }:
{
  flake.modules.nixos.vm = {
    users.users.daniel = {
      description = config.flake.meta.users.vm.name;
      isNormalUser = true;
      createHome = true;
      group = config.flake.meta.users.vm.username;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];

      linger = true;

      autoSubUidGidRange = true;

      initialPassword = "changeme";

      openssh.authorizedKeys.keys = config.flake.meta.users.vm.authorizedKeys;
    };
    users.groups = {
      daniel.gid = 1000;
    };
  };
}
