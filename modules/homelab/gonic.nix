{ config, ... }:
{
  flake.modules.homeManager.gonic = {
    virtualisation.quadlet.containers = {
      gonic = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "docker.io/sentriz/gonic:latest";
          environments = {
            TZ = "America/Chicago";
          };
          publishPorts = [ "4747:80" ];
        };
      };
    };
  };
}
