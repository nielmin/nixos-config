{
  flake.modules.nixos.kanata = { pkgs, ... }: {
    services = {
      kanata = {
        enable = true;
        keyboards.default = {
          configFile = ./default.kbd;
        };
      };
    };
  };
}
