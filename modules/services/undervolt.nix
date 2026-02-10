{
  flake.modules.nixos.undervolt = {
    services.undervolt = {
      enable = true;
      coreOffset = -90;
    };
  };
}
