{ config, ... }:
{
  flake.modules.homeManager.kavita = {
    virtualisation.quadlet.containers = {
      kavita = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "ghcr.io/kareadita/kavita:latest";
          publishPorts = [ "5000:5000" ];
          userns = "keep-id";
        };
      };
    };
  };
}
