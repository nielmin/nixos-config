{
  lib,
  den,
  __findFile,
  ...
}:
{
  den = {
    schema.user.classes = lib.mkDefault [
      "homeManager"
      "hjem"
    ];

    aspects = {
      daniel =
        {
          host,
          user,
        }:
        {
          includes = [
            <den.provides.define-user>
            <den.provides.primary-user>
            (den.provides.user-shell "fish")
            <nlm/dev>
          ]
          ++ lib.optionals (!(host.hostName == "siv")) [
            <nlm/multimedia>
          ]
          ++ lib.optionals (host.isLaptop) [
            <nlm/niri>
            <nlm/browsers>
            <nlm/stylix>
          ];

          nixos = { config, ... }: {
            sops.secrets.userPass.neededForUsers = true;

            users.mutableUsers = true;
            users.users."${user.userName}" = {
              hashedPasswordFile = config.sops.secrets.userPass.path;
              group = "${user.userName}";
              extraGroups = [
                "networkmanager"
                "incus-admin"
                "podman"
                "samba"
                "uinput"
                "video"
              ];
              openssh.authorizedKeys.keys = [
                "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
              ];
            };
            users.groups."${user.userName}" = {
              gid = 1000;
            };
          };

          hjem = { ... }: {
            user = "${user.userName}";
            directory = "/home/${user.userName}";
            clobberFiles = true;
          };
        };

      nuc = {
        includes = [
          <den.provides.define-user>
          <den.provides.primary-user>
        ];
        nixos = { config, ... }: {
          users.users.nuc = {
            hashedPasswordFile = config.sops.secrets.userPass_nuc.path;
            group = "nuc";
            extraGroups = [
              "video"
              "wheel"
              "networkmanager"
              "incus-admin"
              "dialout"
            ];
          };
          users.groups.nuc = { };
        };
      };
    };
  };
}
