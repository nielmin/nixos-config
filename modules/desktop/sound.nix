{
  flake.modules.nixos.sound = {
    security.rtkit.enable = true;
    
    services.pipewire = {
      alsa.enable = true;
      alsa.support32Bit = true;
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
