{
  inputs,
  den,
  nlm,
  __findFile,
  ...
}: {
  den.aspects.ines = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-amd>
      <nlm/kde-desktop>
      <nlm/cad>
      <nlm/services>
      <nlm/dev>
      <nlm/gaming>
    ];
    nixos = {pkgs, ...}: {
      imports = [
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
        kernelModules = [ "v4l2loopback" ];
        extraModulePackages = [ pkgs.linuxPackages_latest.v4l2loopback ];
        extraModprobeConfig = ''
          options v4l2loopback exclusive_caps=1 card_label="Virtual Webcam"
        '';
      };
    };
  };
}
