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
      <nlm/dev>
      <nlm/services>
      <nlm/niri-desktop>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];
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
