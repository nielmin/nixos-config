{
  nlm,
  __findFile,
  ...
}: {
  nlm.multimedia = {
    includes = [
      <nlm/mpv>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        obs-studio
      ];
    };

    homeManager = {pkgs, ...}: {
      services.easyeffects = {
        enable = true;
      };
    };
  };
}
