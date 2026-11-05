{
  self,
  inputs,
  ...
}:
{
  config.flake.factory.vm-user =
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
          sops.defaultSopsFile = config.sops.defaultSopsFile;

          user.userName = username;

          users.mutableUsers = true;
          users.users."${username}" = {
            isNormalUser = true;
            initialPassword = username;
            group = username;
            extraGroups = [
              "lpadmin"
              "networkmanager"
              "video"
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
