{ config, ... }:
{
  flake.modules.nixos.jellyfin = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/jellyfin - daniel daniel - -"
      "d /home/daniel/containers/jellyfin/config - daniel daniel - -"
    ];
  };

  flake.modules.homeManager.jellyfin = {
    virtualisation.quadlet.containers = {
      jellyfin = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "ghcr.io/jellyfin/jellyfin:latest";
          publishPorts = [ "8096:8096" ];
          userns = "keep-id";
          devices = [ "/dev/dri/renderD128:/dev/dri/renderD128" ];
          volumes = [
            "%h/containers/jellyfin/config:/config"
          ];
        };
      };
    };
  };
}
