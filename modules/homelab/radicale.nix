{ config, ... }:
{
  flake.modules.nixos.radicale = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/radicale/data - daniel daniel - -"
      "d /home/daniel/containers/radicale/config - daniel daniel - -"
    ];
  };

  flake.modules.homeManager.radicale = {
    virtualisation.quadlet.containers = {
      radicale = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "docker.io/tomsquest/docker-radicale";
          autoUpdate = "registry";
          readOnly = true;
          runInit = true;
          noNewPrivileges = true;
          publishPorts = [ "5232:5232" ];
          userns = "keep-id";
          dropCapablities = "ALL";
          addCapabilties = [
            "SETUID"
            "SETGID"
            "CHOWN"
            "KILL"
          ];
          healthCmd = "curl -f http://127.0.0.1:5232 || exit 1";
          healthInterval = "30s";
          healthRetries = 3;
          volumes = [
            "%h/containers/radicale/data:/data"
            "%h/containers/radicale/config:/config:ro"
          ];
        };
      };
    };
  };
}
