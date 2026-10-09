{ inputs, ... }: {
  flake.modules.nixos.bootable = {
    imports = with inputs.self.modules.nixos; [
      # (modulesPath + "/installer/scan/not-detected.nix")
      base
      cli
      networking
      security
    ];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.kernelModules = [ ];

    powerManagement.enable = true;

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
      uinput = {
        enable = true;
      };
    };
  };
}
