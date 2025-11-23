{ inputs, ... }:
{
  flake.modules.nixos.jellyfin = {
    imports = [ inputs.quadlet-nix.homeManagerModules.quadlet ];

    virtualisation.quadlet.containers = {
      jellyfin = {
        autoStart = true;
        serviceConfig = {
          RestartSec = "10";
          Restart = "always";
        };
        containerConfig = {
          image = "ghcr.io/jellyfin/jellyfin:latest";
          publishPorts = [ "127.0.0.1:8096:8096" ];
          userns = "keep-id";
        };
      };
    };
  };
}
