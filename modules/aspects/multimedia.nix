{den, ...}: {
  den.aspects.multimedia = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
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
