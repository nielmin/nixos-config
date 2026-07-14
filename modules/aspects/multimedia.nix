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

    homeManager = {pkgs, lib, ...}: {
      services.easyeffects = {
        enable = true;
        extraPresets = {
          "TRUTHEAR GATE" = lib.importJSON ./easyeffects/truthear-gate.json;
        };
      };
    };
  };
}
