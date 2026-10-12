{
  flake.modules.nixos.kanata = {
    hardware.uinput = {
      enable = true;
    };
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
