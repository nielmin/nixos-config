{inputs, den, ...}: {
  den.aspects.ines = {
    includes = [
      den.aspects.bootable
      den.aspects.kvm-amd
      den.aspects.gfx-amd
      den.aspects.kde-desktop
      den.aspects.services
      den.aspects.dev
      den.aspects.gaming
    ];
    nixos = {pkgs, ...}: {

      imports = [
        inputs.disko.nixosModules.disko
        inputs.preservation.nixosModules.default
        ./_disko.nix
	./_preservation.nix
      ];

      networking.hostName = "ines";

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
