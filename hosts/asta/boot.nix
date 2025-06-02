{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ../../modules
    ./hardware-configuration.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."luks-6b83a834-d164-4db5-bb64-139afd3c9731".device = "/dev/disk/by-uuid/6b83a834-d164-4db5-bb64-139afd3c9731";

  # Bootloader.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

}
