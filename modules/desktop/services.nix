{ inputs, ... }: {
  flake.modules.nixos.services = { config, ... }: {
    imports = [
      inputs.self.modules.kanata
      inputs.self.modules.printing
      inputs.self.modules.restic
      inputs.self.modules.scanning
    ];
    networking.firewall.allowedTCPPorts = [ 8384 ];
    services = {
      syncthing = {
        enable = true;
        user = "${config.user.userName}";
        group = "${config.user.userName}";
        dataDir = "/home/${config.user.userName}";
        openDefaultPorts = true;
        guiAddress = "0.0.0.0:8384";
      };
      qbittorrent = {
        enable = true;
        user = "${config.user.userName}";
        group = "${config.user.userName}";
        webuiPort = 8081;
        extraArgs = [ "--confirm-legal-notice" ];
        openFirewall = true;
      };
    };
  };
}
