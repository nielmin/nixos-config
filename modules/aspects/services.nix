{ den, ... }: {
  den.aspects.services = {
    nixos = { pkgs, ... }: {
      services = {
      	syncthing.enable = true;
      };
    };
  };
}
