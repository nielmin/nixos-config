{ config, ... }:
{
  nixosHosts.vm = {
    unstable = true;
  };

  flake.modules.nixos.host_vm.imports = with config.flake.modules.nixos; [
    ./_nixos
    dev
  ];
}
