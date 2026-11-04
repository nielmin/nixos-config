{ inputs, ... }: {
  flake.modules.nixos.octoprint = { config, pkgs, ... }: {
    networking.firewall = {
      allowedTCPPorts = [ 5000 ];
    };

    systemd.tmpfiles.rules = [
      "d /home/${config.user.userName}/containers 0755 ${config.user.userName} ${config.user.userName} - -"
      "d /home/${config.user.userName}/containers/octoprint 0755 ${config.user.userName} ${config.user.userName} - -"
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
              "/home/${config.user.userName}/containers:/octoprint"
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
