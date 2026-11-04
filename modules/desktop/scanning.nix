{
  flake.modules.nixos.scanning = { pkgs, ... }: {
    hardware.sane.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.skanlite
      sane-backends
    ];
  };
}
