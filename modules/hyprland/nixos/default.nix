{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
      };

      environment.systemPackages = with pkgs; [
        hyprpaper
        hypridle
        hyprsunset
        hyprlock
      ];

      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
        config.common.default = "*";
      };
    };
}
