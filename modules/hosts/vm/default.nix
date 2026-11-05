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
        inputs.self.modules.nixos.vm-disk
      ];

      hardware.graphics.enable = true;

      virtualisation.vmVariant = {
        virtualisation = {
          memorySize = 4096;
          cores = 4;
          graphics = true;
          qemu.options = [
            "-vga none"
            "-device virtio-gpu-gl-pci"
            "-display gtk,gl=on"
          ];
        };
      };

      boot = {
        initrd.availableKernelModules = [ ];
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [ ];
        extraModulePackages = [ ];
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
