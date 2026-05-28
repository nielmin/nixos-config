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
      <nlm/gfx-amd>
      <nlm/kde-desktop>
      <nlm/services>
      <nlm/dev>
      <nlm/gaming>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];

      networking.hostName = "ines";

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
