{ nlm, ...}: {
  nlm.multimedia = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        easyeffects
        obs-studio
      ];
    };
    homeManager = {pkgs, ...}: {
      programs.mpv = {
        enable = true;
      };
    };
  };
}
