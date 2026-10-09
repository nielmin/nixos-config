{
  inputs,
}:
{
  flake.modules.nixos.liv = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.bootable
      inputs.self.modules.nixos.btrfs
      inputs.self.modules.nixos.cpu-amd
      inputs.self.modules.nixos.kde-desktop
      inputs.disko.nixosModules.disko
      ./_disko.nix
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
  };
}
