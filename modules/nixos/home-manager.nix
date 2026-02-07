topLevel@{ inputs, ... }:
{
  flake.nixosModules.home-manager =
    { config, ... }:
    let
      inherit (config.networking) hostName;
    in
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";

        users.daniel.imports = [
          topLevel.config.flake.modules.homeManager.core
          (topLevel.config.flake.modules.homeManager."host_${hostName}" or { })
        ];

        extraSpecialArgs.inputs = inputs;
      };
    };
}
