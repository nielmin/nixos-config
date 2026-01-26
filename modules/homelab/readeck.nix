{ config, ... }:
let
  name = "readeck";
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
          image = "codeberg.org/readeck/readeck:latest";
          autoUpdate = "registry";
          publishPorts = [ "8000:8000" ];
          environments = {
            READECK_LOG_LEVEL = "info";
            READECK_SERVER_HOST = "0.0.0.0";
            READECK_SERVER_PORT = "8000";
          };
          volumes = [
            "%h/containers/${name}:/${name}"
          ];
          healthCmd = "/bin/readeck healthcheck -config config.toml";
        };
      };
    };
  };
}
