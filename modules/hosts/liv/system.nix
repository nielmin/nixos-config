{
  inputs,
  den,
  nlm,
  __findFile,
  ...
}: {
  den.aspects.liv = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-amd>
      <nlm/gfx-amd>
      <nlm/kde-desktop>
      <nlm/services>
      <nlm/dev>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];

      networking.hostName = "liv";

      hardware.facter.reportPath = ./facter.json;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];
    };
  };
}
