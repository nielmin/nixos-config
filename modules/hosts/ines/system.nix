{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.ines = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.bootable
      inputs.self.modules.nixos.btrfs
      inputs.self.modules.nixos.cad
      inputs.self.modules.nixos.cpu-amd
      inputs.self.modules.nixos.dev
      inputs.self.modules.nixos.gaming
      inputs.self.modules.nixos.kde-desktop
      inputs.self.modules.nixos.services
      inputs.self.modules.nixos.utils
      inputs.self.modules.nixos.virtualisation
      inputs.disko.nixosModules.disko
      ./_disko.nix
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
  };
}
