{ config, ... }:
{
  flake.modules.nixos.kavita = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/kavita - daniel daniel - -"
    ];
  };

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
          volumes = [
            "%h/containers/kavita:/kavita/config"
          ];
        };
      };
    };
  };
}
