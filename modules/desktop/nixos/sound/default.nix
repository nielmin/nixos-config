{
  flake.modules.nixos.desktop.sound = {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
