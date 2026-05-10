{den, ...}: {
  den.aspects.asta = {
    includes = [
      den.aspects.bootable
      den.aspects.kvm-intel
      den.aspects.gfx-intel
      den.aspects.kde-desktop
      den.aspects.services
      den.aspects.dev
    ];
    nixos = {pkgs, ...}: {
      networking.hostName = "asta";

      hardware.facter.reportPath = ./facter.json;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/5a912b82-9b36-491c-8d35-de3e8b529f73";
        fsType = "btrfs";
        options = ["subvol=@"];
      };

      fileSystems."/home" = {
        device = "/dev/disk/by-uuid/5a912b82-9b36-491c-8d35-de3e8b529f73";
        fsType = "btrfs";
        options = ["subvol=@home"];
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/F5AB-2BF0";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      swapDevices = [];
    };
  };
}
