{ config, ... }:
{
  flake.modules.nixos.gonic = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/gonic - daniel daniel - -"
      "d /home/daniel/containers/gonic/data - daniel daniel - -"
      "d /home/daniel/containers/gonic/playlists - daniel daniel - -"
      "d /home/daniel/containers/gonic/podcasts - daniel daniel - -"
    ];
  };

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
