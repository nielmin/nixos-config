{__findFile, ...}: {
  nlm.services = {
    includes = [
      <nlm/kanata>
      <nlm/printing>
      <nlm/restic>
    ];
    nixos = {user, ...}: {
      services = {
        syncthing = {
          enable = true;
          user = "${user.userName}";
          group = "${user.userName}";
          dataDir = "/home/${user.userName}";
        };
        qbittorrent = {
          enable = true;
          user = "${user.userName}";
          group = "${user.userName}";
          webuiPort = 8081;
          extraArgs = ["--confirm-legal-notice"];
        };
      };
    };
  };
}
