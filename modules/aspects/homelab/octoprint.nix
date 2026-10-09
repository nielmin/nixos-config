{
  flake.modules.nixos.homelab.octoprint = { config, ... }: {
    networking.firewall = {
      allowedTCPPorts = [ 5000 ];
    };

    systemd.tmpfiles.rules = [
      "d /home/${config.username}/containers 0755 ${config.username} ${config.username} - -"
      "d /home/${config.username}/containers/octoprint 0755 ${config.username} ${config.username} - -"
    ];

    virtualisation.quadlet =
      let
        inherit (config.virtualisation.quadlet) networks pods;
      in
      {
        containers.octoprint = {
          containerConfig = {
            name = "octoprint";
            image = "docker.io/octoprint/octoprint";
            autoUpdate = "registry";
            devices = [
              "/dev/ttyUSB0:/dev/ttyACM0"
            ];
            volumes = [
              "/home/${config.username}/containers:/octoprint"
            ];
            publishPorts = [
              "5000:80"
            ];
          };
          serviceConfig = {
            TimeoutStartSec = "60";
          };
          unitConfig = {
            Description = "Octoprint server";
          };
        };
      };
  };
}
