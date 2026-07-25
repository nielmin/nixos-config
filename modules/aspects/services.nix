{
  nlm,
  __findFile,
  ...
}: {
  nlm.services = {
    includes = [
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

        kanata = {
          enable = true;
          keyboards.default = {
            config = ''
              (defsrc
                caps)

              (deflayermap (default-layer)
                ;; tap caps lock as caps lock, hold caps lock as left control
                caps (tap-hold 100 100 caps lctl))
            '';
          };
        };
      };
    };
  };
}
