{ __findFile, ... }: {
  nlm.services = {
    includes = [
      <nlm/kanata>
      <nlm/printing>
      <nlm/restic>
      <nlm/scanning>
    ];
    nixos = { user, ... }: {
      networking.firewall.allowedTCPPorts = [ 8384 ];
      services = {
        syncthing = {
          enable = true;
          user = "${user.userName}";
          group = "${user.userName}";
          dataDir = "/home/${user.userName}";
          openDefaultPorts = true;
          guiAddress = "0.0.0.0:8384";
        };
        qbittorrent = {
          enable = true;
          user = "${user.userName}";
          group = "${user.userName}";
          webuiPort = 8081;
          extraArgs = [ "--confirm-legal-notice" ];
          openFirewall = true;
        };
      };
    };
  };
}
