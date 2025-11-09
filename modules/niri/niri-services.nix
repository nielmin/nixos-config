{
  flake.modules = {
    homeManager.niri = {
      services.swayidle.enable = true;
    };

    nixos.niri = {
      services = {
        geoclue2.enable = true;

        gnome.gnome-keyring.enable = true; # secret service

        displayManager.sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
    };
  };
}
