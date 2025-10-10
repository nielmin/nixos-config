{
  flake.modules.nixos.sound = {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };

  flake.modules.homeManager.sound = {
    services.easyeffects = {
      enable = true;
    };
  };
}
