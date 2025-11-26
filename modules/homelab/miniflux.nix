{ config, ... }:
{
  flake.modules.nixos.miniflux = {
    systemd.tmpfiles.rules = [
      "d /home/daniel/containers/miniflux - daniel daniel - -"
    ];
  };
  flake.modules.homeManager.miniflux = {
    virtualisation.quadlet = let 
      inherit (config.virtualisation.quadlet) volumes pods;
    in {
      containers = {
        miniflux-db = {
          autoStart = true;
          serviceConfig = {
            RestartSec = "10";
            Restart = "always";
          };
          containerConfig = {
            image = "docker.io/postgres:17-alpine";
            environments = {
              TZ = "America/Chicago";
              POSTGRES_USER = "miniflux";
              POSTGRES_PASSWORD = "miniflux";
              POSTGRES_DB = "miniflux";
            };
            volumes = [
              "%h/containers/miniflux:/var/lib/postgresql/data"
            ];
            pod = "miniflux.pod";
          };
        };
        miniflux-web = {
          autoStart = true;
          serviceConfig = {
            RestartSec = "10";
            Restart = "always";
          };
          unitConfig = {
            Wants = "miniflux-db.service";
            After = "miniflux-db.service";
          };
          containerConfig = {
            image = "ghcr.io/miniflux/miniflux:latest";
            environments = {
              TZ = "America/Chicago";
              DATABASE_URL="postgres://miniflux:miniflux@localhost/miniflux?sslmode=disable";
              RUN_MIGRATIONS = "1";
              CREATE_ADMIN = "1";
              ADMIN_USERNAME = "admin";
              ADMIN_PASSWORD = "test123";
            };
            pod = "miniflux.pod";
          };
        };
      };
      pods = {
        miniflux = {
          podConfig = {
            name = "minflux-pod";
            publishPorts = [ "8083:8080" ];
            userns = "keep-id";
          };
        };
      };
    };
  };
}
