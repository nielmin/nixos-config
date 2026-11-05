{
  self,
  inputs,
  ...
}:
{
  config.flake.factory.daniel =
    {
      username,
      isAdmin,
    }:
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      config = lib.mkMerge [
        {
          user.userName = username;

          sops.secrets = {
            "userPass" = {
              key = "userPass";
            };
          };

          sops.secrets.userPass.neededForUsers = true;

          users.mutableUsers = true;
          users.users."${username}" = {
            isNormalUser = true;
            hashedPasswordFile = config.sops.secrets.userPass.path;
            group = username;
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
            ];
            extraGroups = [
              "incus-admin"
              "lpadmin"
              "networkmanager"
              "podman"
              "samba"
              "scanner"
              "restic"
              "uinput"
              "video"
            ]
            ++ lib.optionals isAdmin [
              "wheel"
            ];
          };

          users.groups.${username} = { };

          home-manager.users.${username} = {
            imports = [
              inputs.self.modules.homeManager.multimedia
            ];
            programs.home-manager.enable = true;
          };
        }
      ];
    };
}
