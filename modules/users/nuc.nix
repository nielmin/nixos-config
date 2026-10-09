{
  self,
  lib,
  ...
}:

let
  username = "nuc";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" true)
    {

      home-manager.users.${username} = {
        imports = with self.modules.homeManager; [
          dev
        ];
      };

      nixos.${username} = { config, pkgs, ... }: {
        imports = with self.modules.nixos; [
          dev
        ];

        users.users.${username} = {
          hashedPasswordFile = config.sops.secrets.userPass.path;
          shell = pkgs.fish;
          group = username;
          extraGroups = [
            "video"
            "networkmanager"
            "incus-admin"
            "dialout"
          ];

          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
          ];
        };

        users.groups.${username} = {
          gid = 1000;
        };

        programs.fish.enable = true;
      };
    }
  ];
}
