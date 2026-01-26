{ config, ... }:
let
  name = "pdfding";
in
{
  flake.modules.nixos.${name} = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/${name} - daniel daniel - -"
      "d /home/daniel/containers/${name}/db - daniel daniel - -"
      "d /home/daniel/containers/${name}/media - daniel daniel - -"
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
          image = "docker.io/mrmn/pdfding:latest";
          autoUpdate = "registry";
          publishPorts = [ "8010:8000" ];
          environments = {
            HOST_NAME = "127.0.0.1";
          };
          volumes = [
            "%h/containers/${name}/db:/home/nonroot/pdfding/db"
            "%h/containers/${name}/media:/home/nonroot/pdfding/media"
          ];
          userns = "keep-id:uid=1000,gid=1000";
        };
      };
    };
  };
}
