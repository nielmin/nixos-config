{ inputs, ... }:
{
  flake.modules.nixos.host_printer =
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
      ];

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };

      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          # For modern Intel CPU's
          intel-media-driver # Enable Hardware Acceleration
          vpl-gpu-rt # Enable QSV
        ];
      };
      environment.sessionVariables = {
        LIBVA_DRIVER_NAME = "iHD";
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
      };
      networking.useDHCP = lib.mkDefault true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
}
