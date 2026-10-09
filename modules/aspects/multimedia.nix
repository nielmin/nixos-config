{ inputs, ... }: {
  flake.modules.nixos.multimedia = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      mpv
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
