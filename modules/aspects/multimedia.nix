{ nlm, __findFile, ...}: {
  nlm.multimedia = {
    includes = [
      <nlm/mpv>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        easyeffects
        obs-studio
      ];
    };
  };
}
