{
  self,
  inputs,
  ...
}:
{
  config.flake.factory.nuc =
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
          sops.secrets = {
            "nucPass" = {
              key = "nucPass";
            };
          };
          sops.secrets.nucPass.neededForUsers = true;

          users.mutableUsers = true;
          users.users."${username}" = {
            hashedPasswordFile = config.sops.secrets.userPass.path;
            group = username;
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
            ];
            extraGroups = [
              "video"
              "wheel"
              "networkmanager"
              "incus-admin"
              "dialout"
            ]
            ++ lib.optionals isAdmin [
              "wheel"
            ];
          };

          users.groups.${username} = { };
        }
      ];
    };
}
