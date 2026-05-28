{nlm, ...}: {
  nlm.bootable = {
    nixos = {
      modulesPath,
      pkgs,
      ...
    }: {
      imports = [(modulesPath + "/installer/scan/not-detected.nix")];
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;
      boot.initrd.kernelModules = [];
      boot.extraModulePackages = [];

      powerManagement.enable = true;

      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };
  };
}
