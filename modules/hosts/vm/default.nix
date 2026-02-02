{ config, ... }:
{
  nixosHosts.vm = {
    unstable = true;
    hostName = "vm";
  };

  flake.modules.nixos.host_vm.imports = with config.flake.modules.nixos; [
    dev
    homelab
  ];
}
