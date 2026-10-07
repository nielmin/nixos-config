{
  nlm.scanning = {
    nixos = { pkgs, ... }: {
      hardware.sane.enable = true;

      environment.systemPackages = with pkgs; [
        kdePackages.skanlite
        sane-backends
      ];
    };
  };
}
