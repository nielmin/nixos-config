{
  inputs,
  den,
  ...
}: {
  den.aspects.nuc = {
    includes = [
      den.aspects.bootable
      den.aspects.kvm-intel
      den.aspects.locale
      den.aspects.networking
      den.aspects.graphics
      den.aspects.octoprint
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./disko.nix
      ];

      networking.hostName = "nuc";

      hardware.facter.reportPath = ./facter.json;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
    };
  };
}
