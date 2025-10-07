{
  flake.modules.nixos.sway =
    { pkgs, ... }:

    {
    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    services.dbus.enable = true;

    services.gnome.gnome-keyring.enable = true;

    security.pam.loginLimits = [
      { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
    ];

    environment.systemPackages = with pkgs; [
      mako
    ];

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}
