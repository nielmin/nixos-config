{nlm, ...}: {
  nlm.octoprint = {
    nixos = {pkgs, config, user, ...}: {
      networking.firewall = {
        allowedTCPPorts = [ 5000 ];
      };

      systemd.tmpfiles.rules = [
        "d /home/${user.userName}/containers 0755 nuc nuc - -"
        "d /home/${user.userName}/containers/octoprint 0755 nuc nuc - -"
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
              "/dev/ttyUSB0:/dev/ttyACM0"
            ];
            volumes = [
              "/home/${user.userName}/containers:/octoprint"
            ];
            publishPorts = [
              "5000:80"
            ];
          };
        };
      };
    };
    homeManager = { pkgs, ... }: { };
  };
}
