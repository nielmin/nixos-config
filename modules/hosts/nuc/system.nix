{
  inputs,
  ...
}:
{
  flake.modules.nixos.nuc = { pkgs, ... }: {
    imports = [
      inputs.self.modules.nixos.bootable
      inputs.self.modules.nixos.btrfs
      inputs.self.modules.nixos.cpu-intel
      inputs.self.modules.nixos.virtualisation
      inputs.self.modules.nixos.homelab
      inputs.self.modules.nixos.homelab.octoprint
      inputs.disko.nixosModules.disko
      ./_disko.nix
    ];

    hardware.facter.reportPath = ./facter.json;

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ ];
      extraModulePackages = [ ];
    };

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
        allowedTCPPorts = [
          80
          443
          8443
          8080
        ];
      };
    };
  };
}
