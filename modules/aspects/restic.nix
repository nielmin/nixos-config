{
  nlm.restic = {
    nixos = { config, pkgs, ... }: {
      environment.systemPackages = with pkgs; [ restic ];
      sops.secrets = {
        "restic_server" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "restic_server";
          owner = "restic";
          group = "restic";
        };
        "restic_repo" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "restic_repo";
          owner = "restic";
          group = "restic";
        };
      };

      services.restic = {
        server = {
          enable = true;
          htpasswd-file = config.sops.secrets."restic_server".path;
        };
        backups.emi = {
          paths = [
            "/kpool/data/Documents"
            "/kpool/data/Pictures"
            "/kpool/data/Videos"
            "/kpool/media/music"
          ];

          pruneOpts = [
            "--keep-daily 4"
            "--keep-weekly 4"
            "--keep-monthly 3"
          ];

          timerConfig = {
            OnCalendar = "daily";
            Persistent = true;
          };

          passwordFile = config.sops.secrets."restic_repo".path;
          repository = "/epool/data/restic";
        };
      };
    };
  };
}
