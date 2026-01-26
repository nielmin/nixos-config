{
  config,
  pkgs,
  ...
}:
{
  flake.modules.nixos.vm =
    { pkgs, ... }:
    {
      users.users.vm = {
        description = config.flake.meta.users.vm.name;
        isNormalUser = true;
        createHome = true;
        group = "daniel";

        extraGroups = [
          "wheel"
          "networkmanager"
        ];

        linger = true;

        autoSubUidGidRange = true;

        hashedPasswordFile = config.age.secrets.vm_pass.path;

        openssh.authorizedKeys.keys = config.flake.meta.users.vm.authorizedKeys;
      };
      users.groups = {
        daniel.gid = 1000;
      };
    };
}
