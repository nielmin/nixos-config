{
  inputs,
  ...
}:
{
  flake.modules.nixos.siv =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.self.modules.nixos.siv-disk
      ];

      hardware.facter.reportPath = ./facter.json;

      boot = {
        kernelPackages = pkgs.linuxPackages;
        kernelModules = [ ];
        extraModulePackages = [ ];
        supportedFilesystems = {
          btrfs = true;
          zfs = true;
        };
        zfs = {
          forceImportRoot = false;
          extraPools = [
            "emi"
            "kai"
          ];
        };
      };

      networking.hostId = "aba04682";
      networking.hostName = "siv";

      services.zfs.autoScrub.enable = true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
