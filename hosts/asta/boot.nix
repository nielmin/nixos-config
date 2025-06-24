{ config, pkgs, lib, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
      luks.devices."luks-6b83a834-d164-4db5-bb64-139afd3c9731".device = "/dev/disk/by-uuid/6b83a834-d164-4db5-bb64-139afd3c9731";
      systemd.enable = true;
    };

    # Bootloader.
    loader = {
      systemd-boot.enable = lib.mkForce true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
    };

    bootspec.enable = true;

    lanzaboote = {
      enable = false;
      pkiBundle = "/var/lib/sbctl";
    };
  };
}
