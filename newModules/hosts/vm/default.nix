{ config, ... }:
{
  nixosHosts.vm = {
    unstable = false;
  };

  flake.modules.nixos.host_vm.imports = with config.flake.modules.nixos; [
    ./_nixos
    dev
  ];
}
