{
  inputs,
  ...
}:
{
  flake.modules.nixos.vm =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      hardware.graphics.enable = true;

      virtualisation.vmVariant = {
        virtualisation = {
          memorySize = 4096;
          cores = 4;
          graphics = true;
        };
        virtualisation.qemu.options = [
          "-vga none"
          "-device virtio-gpu-gl-pci"
          "-display gtk,gl=on"
        ];
      };

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

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
