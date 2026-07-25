
{
  nlm,
  ...
}: {
  nlm.kanata = {
    nixos = {pkgs, ...}: {
      services = {
        kanata = {
          enable = true;
          keyboards.default = {
            configFile = ./default.kbd;
          };
        };
      };
    };
  };
}
