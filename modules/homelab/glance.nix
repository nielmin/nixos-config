{ config, ... }:
let
  name = "glance";
in
{
  flake.modules.nixos.${name} = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/${name} - daniel daniel - -"
    ];
  };

  flake.modules.homeManager.${name} = {
    virtualisation.quadlet.containers = {
      ${name} = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "docker.io/glanceapp/glance:latest";
          autoUpdate = "registry";
          publishPorts = [ "8080:8080" ];
          environments = {
            TZ = "America/Chicago";
          };
          volumes = [
            "%h/containers/${name}:/app/config"
          ];
        };
      };
    };
  };
}
