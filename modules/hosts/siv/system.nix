{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.siv = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.bootable
      inputs.self.modules.nixos.btrfs
      inputs.self.modules.nixos.cpu-intel
      inputs.self.modules.nixos.services
      inputs.self.modules.nixos.smb
      inputs.self.modules.nixos.smb-server
      inputs.disko.nixosModules.disko
      ./_disko.nix
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

    services.zfs.autoScrub.enable = true;
  };
}
