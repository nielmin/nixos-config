{nlm, ...}: {
  nlm.graphics = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        inkscape
      ];
    };
  };
}
