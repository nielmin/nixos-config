{
  inputs,
  den,
  nlm,
  __findFile,
  ...
}: {
  den.aspects.liv = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-amd>
      <nlm/niri-desktop>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];
      hardware.facter.reportPath = ./facter.json;

      boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [];
        extraModulePackages = [];
      };

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "rtsx_pci_sdmmc"
      ];
    };
  };
}
