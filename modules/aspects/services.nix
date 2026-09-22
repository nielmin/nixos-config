{__findFile, ...}: {
  nlm.services = {
    includes = [
      <nlm/kanata>
      <nlm/printing>
    ];
    nixos = {
      config,
      user,
      ...
    }: {
      programs = {
        localsend = {
          enable = true;
          openFirewall = true;
        };
      };

      services = {
        syncthing = {
          enable = true;
          user = "${user.userName}";
          group = "${user.userName}";
          dataDir = "/home/${user.userName}";
        };
        restic.server = {
          enable = true;
          htpasswd-file = config.sops.secrets."restic_server/password".path;
        };
      };
    };
  };
}
