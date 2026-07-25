{
  nlm,
  __findFile,
  ...
}: {
  nlm.services = {
    includes = [
      <nlm/kanata>
      <nlm/printing>
    ];
    nixos = {pkgs, user, ...}: {
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
      };

    };
  };
}
