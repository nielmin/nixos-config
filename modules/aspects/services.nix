{den, ...}: {
  den.aspects.services = {
    nixos = {pkgs, ...}: {
      security.rtkit.enable = true;
      services = {
        pulseaudio.enable = false;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };
      };
    };
    homeManager = {pkgs, ...}: {
      services.syncthing = {
        enable = true;
      };
    };
  };
}
