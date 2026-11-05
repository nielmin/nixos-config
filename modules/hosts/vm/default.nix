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
