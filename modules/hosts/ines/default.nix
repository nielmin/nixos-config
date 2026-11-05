{
  inputs,
  ...
}:
{
  flake.modules.nixos.ines =
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
        inputs.self.modules.nixos.ines-disk
      ];

      hardware.facter.reportPath = ./facter.json;

      boot = {
        initrd.availableKernelModules = [
          "xhci_pci"
          "ahci"
          "usb_storage"
          "sd_mod"
        ];
        kernelPackages = pkgs.linuxPackages_latest;
        kernelModules = [ "v4l2loopback" ];
        extraModulePackages = [ pkgs.linuxPackages_latest.v4l2loopback ];
        extraModprobeConfig = ''
          options v4l2loopback exclusive_caps=1 card_label="Virtual Webcam"
        '';
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}
