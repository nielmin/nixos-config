{
  inputs,
  ...
}:
{
  flake.modules.nixos.vm = { modulesPath, pkgs, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot = {
      initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ ];
      extraModulePackages = [ ];
    };
  };
}
