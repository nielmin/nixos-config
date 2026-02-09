{ inputs, ... }:
{
  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      verbose = true;
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "bak";
      backupCommand = "rm";
      overwriteBackup = true;
    };
  };
  flake.modules.homeManager.home-manager = {
    programs.home-manager.enable = true;
  };

}
