{ inputs, ... }:
{
  flake.modules.nixos.host_asta =
    {
      config,
      lib,
      modulesPath,
      pkgs,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
        inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
      ];

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      boot = {
        initrd = {
          availableKernelModules = [
            "xhci_pci"
            "ahci"
            "usb_storage"
            "sd_mod"
          ];
          kernelModules = [ ];
        };
        kernelModules = [ "kvm-intel" ];
        extraModulePackages = [ ];

        bootspec.enable = true;

        lanzaboote = {
          enable = false;
          pkiBundle = "/var/lib/sbctl";
        };

      };
      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
