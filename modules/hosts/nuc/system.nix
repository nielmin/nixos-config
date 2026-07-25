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
      <nlm/octoprint>
    ];
    nixos = {pkgs, ...}: {
      imports = [
        inputs.disko.nixosModules.disko
        ./_disko.nix
        inputs.quadlet-nix.nixosModules.quadlet
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
