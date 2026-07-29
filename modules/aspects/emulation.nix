{nlm, ...}: {
  nlm.emulation = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        mgba
      ];
    };
  };
}
