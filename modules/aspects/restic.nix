{
  nlm.restic = {
    nixos = { config, pkgs, ... }: {
      networking.firewall = {
        allowedTCPPorts = [ 8000 ];
      };
      environment.systemPackages = with pkgs; [ restic ];
      sops.secrets = {
        "restic_server" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "restic_server";
          owner = "restic";
          group = "restic";
        };
      };

      services.restic = {
        server = {
          enable = true;
          dataDir = "/kpool/data/restic-lab";
          htpasswd-file = config.sops.secrets."restic_server".path;
        };
      };
    };
  };
}
