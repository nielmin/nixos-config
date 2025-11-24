{ config, ... }:
{
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
              "${volumes.miniflux-config.ref}:/var/lib/postgresql/data";
            ];
          };
          volumes.miniflux-config.volumeConfig = {
            type = "bind";
            device = "%h/containers/miniflux";
          };
        };
        miniflux = {
          autoStart = true;
          serviceConfig = {
            RestartSec = "10";
            Restart = "always";
          };
          containerConfig = {
            image = "ghcr.io/miniflux/miniflux";
            environments = {
              TZ = "America/Chicago";
              DATABASE_URL="postgres://miniflux:miniflux@localhost/miniflux?sslmode=disable";
              RUN_MIGRATIONS = 1;
              CREATE_ADMIN = 1;
              ADMIN_USERNAME = "admin";
              ADMIN_PASSWORD = "test123";
            };
          };
        };
      };
      pods = {
        miniflux = {
          podConfig = {
            name = "minflux-pod";
            publishPorts = [ "8083:8080" ];
            usersns = "keep-id";
          };
        };
      };
    };
  };
}
