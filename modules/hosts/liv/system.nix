{inputs, den, ...}: {
  den.aspects.liv = {
    includes = [
      den.aspects.bootable
      den.aspects.kvm-amd
      den.aspects.gfx-amd
      den.aspects.locale
      den.aspects.networking
      den.aspects.kde-desktop
      den.aspects.services
      den.aspects.dev
    ];
    nixos = {pkgs, ...}: {

      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];

      networking.hostName = "liv";

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
