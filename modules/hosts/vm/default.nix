{ config, ... }:
{
  nixosHosts.vm = {
    unstable = true;
    hostName = "nuc";
  };

  flake.modules.nixos.host_vm.imports = with config.flake.modules.nixos; [
    dev
    homelab
    daniel
  ];
}
