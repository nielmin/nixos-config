{
  inputs,
  den,
  nlm,
  __findFile,
  ...
}: {
  den.aspects.nuc = {
    includes = [
      <nlm/bootable>
      <nlm/kvm-intel>
      <nlm/gfx-intel>
      <nlm/octoprint>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
      ];

      networking.hostName = "nuc";

      hardware.facter.reportPath = ./facter.json;

      boot.initrd.availableKernelModules = [
        "xhci_pci"
        "ahci"
        "usb_storage"
        "sd_mod"
      ];

      environment.systemPackages = with pkgs; [
        cyme
      ];
    };
  };
}
