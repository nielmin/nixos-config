{
  inputs,
  ...
}:
{
  flake.modules.nixos.liv =
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
        inputs.self.modules.nixos.liv-disk
      ];
      hardware.facter.reportPath = ./facter.json;

      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [ ];
        extraModulePackages = [ ];
      };

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "rtsx_pci_sdmmc"
      ];
      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
