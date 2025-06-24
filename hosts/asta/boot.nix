{ config, pkgs, lib, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
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
