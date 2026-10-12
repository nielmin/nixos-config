{ inputs, ... }: {
  flake.modules.nixos.services = { config, ... }: {
    imports = with inputs.self.modules.nixos; [
      kanata
      printing
      restic
      scanning
    ];
    networking.firewall.allowedTCPPorts = [ 8384 ];
    services = {
      syncthing = {
        enable = true;
        user = "${config.preferences.user.name}";
        group = "${config.preferences.user.name}";
        dataDir = "/home/${config.preferences.user.name}";
        openDefaultPorts = true;
        guiAddress = "0.0.0.0:8384";
      };
      qbittorrent = {
        enable = true;
        user = "${config.preferences.user.name}";
        group = "${config.preferences.user.name}";
        webuiPort = 8081;
        extraArgs = [ "--confirm-legal-notice" ];
        openFirewall = true;
      };
    };
  };
}
