{ inputs, ... }: {
  flake.modules.nixos.multimedia = { pkgs, ... }: {
    imports = [
      inputs.self.modules.mpv
    ];
    environment.systemPackages = with pkgs; [
      audacity
      obs-studio
    ];
  };

  flake.modules.homeManager.multimedia = { lib, ... }: {
    services.easyeffects = {
      enable = true;
      extraPresets = {
        "TRUTHEAR GATE" = lib.importJSON ./easyeffects/truthear-gate.json;
      };
    };
  };
}
