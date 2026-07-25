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

      networking = {
        useDHCP = false;
        bridges = {
          "br0" = {
            interfaces = [ "eth0" ];
          };
        };
        interfaces = {
          "br0".useDHCP = true;
        };
        firewall = {
          trustedInterfaces = [ "br0" ];
          allowedTCPPorts = [ 80 443 8443 8080 ];
        };
      };
    };
  };
}
