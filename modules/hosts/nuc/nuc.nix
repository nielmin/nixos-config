{den, ...}: {
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
        ./_disko.nix
      ];

      networking.hostName = "nuc";

      hardware.facter.reportPath = ./facter.json;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
      fileSystems."/" = {
        device = "/dev/disk/by-uuid/7f5aa509-c734-4956-bc78-c6ad921be026";
        fsType = "btrfs";
        options = ["subvol=rootfs"];
      };

      fileSystems."/nix" = {
        device = "/dev/disk/by-uuid/7f5aa509-c734-4956-bc78-c6ad921be026";
        fsType = "btrfs";
        options = ["subvol=nix"];
      };

      fileSystems."/home" = {
        device = "/dev/disk/by-uuid/7f5aa509-c734-4956-bc78-c6ad921be026";
        fsType = "btrfs";
        options = ["subvol=home"];
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/2A68-1504";
        fsType = "vfat";
        options = ["fmask=0077" "dmask=0077"];
      };

      fileSystems."/persist" = {
        device = "/dev/disk/by-uuid/7f5aa509-c734-4956-bc78-c6ad921be026";
        fsType = "btrfs";
        options = ["subvol=persist"];
      };

      swapDevices = [];
    };
  };
}
