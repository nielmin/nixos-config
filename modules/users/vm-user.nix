{
  self,
  inputs,
  ...
}:
{
  flake.modules.nixos.vm-user =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      username = if config ? user.userName then config.user.userName else "vm-user";
    in
    {
      imports = [
        inputs.self.modules.nixos.users
      ];

      config = {
        users.users."${username}" = {
          isNormalUser = true;
          password = username;
          extraGroups = [
            "wheel"
            "networkmanager"
            "video"
            "audio"
          ];
        };

        security.sudo.wheelNeedsPassword = false;
        services.getty.autologinUser = username;

        virtualisation.vmVariant = {
          # Pass top-level sops default file into the VM scope
          sops.defaultSopsFile = config.sops.defaultSopsFile;

          virtualisation = {
            memorySize = 4096;
            cores = 4;
            graphics = true;
          };
        };
      };
    };
}
