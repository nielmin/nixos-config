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
          nssmdns4 = true;
        };
        printing = {
          enable = true;
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
