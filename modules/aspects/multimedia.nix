{__findFile, ...}: {
  nlm.multimedia = {
    includes = [
      <nlm/mpv>
    ];
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        audacity
        obs-studio
      ];
    };

    homeManager = {lib, ...}: {
      services.easyeffects = {
        enable = true;
        extraPresets = {
          "TRUTHEAR GATE" = lib.importJSON ./easyeffects/truthear-gate.json;
        };
      };
    };
  };
}
