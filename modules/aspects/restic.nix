{
  flake.modules.nixos.restic = { config, ... }: {
    sops.secrets."restic_server" = {
      sopsFile = ../../secrets/secrets.yaml;
      key = "restic_server";
      owner = "restic";
      group = "restic";
    };
    services.restic.server = {
      enable = true;
      htpasswd-file = config.sops.secrets."restic_server".path;
    };
  };
}
