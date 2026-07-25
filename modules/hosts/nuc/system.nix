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
      <nlm/virtualisation>
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

      environment.systemPackages = with pkgs; [
        cyme
      ];

      networking.firewall = {
        allowedTCPPorts = [ 80 443 8443 8080 ];
      };
    };
  };
}
