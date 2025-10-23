{
  flake.modules.nixos.niri = {
    services = {
      geoclue2.enable = true;

      gnome.gnome-keyring.enable = true; # secret service

      displayManager.ly = {
        enable = true;
        settings = {
          bigclock = "en";
        };
      };
    };
  };
}
