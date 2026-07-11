{
  nlm,
  __findFile,
  ...
}: {
  nlm.services = {
    includes = [
      <nlm/printing>
    ];
    nixos = {pkgs, ...}: {
      services = {
        syncthing = {
          enable = true;
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
