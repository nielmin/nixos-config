{
  flake.nixosModules.undervolt = {
      services.undervolt = {
        enable = true;
        coreOffset = -90;
      };
    };
}
