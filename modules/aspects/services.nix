{nlm, ...}: {
  nlm.services = {
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
        avahi = {
          enable = true;
          openFirewall = true;
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
