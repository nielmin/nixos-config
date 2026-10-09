{ inputs, ... }: {
  flake.modules.nixos.security = {
    imports = with inputs.self.modules.nixos; [
      sops
    ];

    security = {
      sudo = {
        enable = true;
        wheelNeedsPassword = false;
      };
    };
  };
}
