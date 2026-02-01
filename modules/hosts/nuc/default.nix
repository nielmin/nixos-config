{ config, ... }:
{
  nixosHosts.nuc = {
    unstable = true;
    hostName = "nuc";
  };

  flake.modules.nixos.host_nuc.imports = with config.flake.modules.nixos; [
    dev
    octoprint
    daniel
  ];
}
