{nlm, ...}: {
  nlm.octoprint = {
    nixos = {pkgs, config, ...}: {
      systemd.tmpfiles.rules = [
        "d /home/nuc/containers nuc nuc"
        "d /home/nuc/containers/octoprint nuc nuc"
      ];

      virtualisation.quadlet = let
        inherit (config.virtualisation.quadlet) networks pods;
      in {
        containers.octoprint = {
          containerConfig = {
            name = "octoprint";
            image = "docker.io/octoprint/octoprint";
            autoUpdate = "registry";
            devices = [
              # "/dev/ttyACM0:/dev/ttyACM0"
            ];
            networks = [
              "host"
            ];
            volumes = [
              "/home/nuc/containers/octoprint:/octoprint"
            ];
          };
        };
      };
    };
    homeManager = { pkgs, ... }: { };
  };
}
