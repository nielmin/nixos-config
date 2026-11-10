{
  self,
  inputs,
  lib,
  ...
}:
let
  username = "daniel";
in
{
  flake.modules = lib.mkMerge [
    (self.factory.user "${username}" true)
    {
      nixos.${username} = { config, ... }: {
        imports = with self.modules.nixos; [

        ];

        sops.secrets."users/daniel" = {
          key = "users/daniel";
          neededForUsers = true;
        };

        users.mutableUsers = true;
        users.users.${username} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets."users/daniel".path;
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
          ];
        };
      };

      homeManager.${username} = { pkgs, ... }: {
        imports = with self.modules.homeManager; [
          multimedia

        ];

      };
    }
  ];

  flake.homeConfigurations = inputs.self.lib.mkHomeManager "x86_64-linux" "daniel";
}
