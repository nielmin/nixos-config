{
  flake.modules.homeManager.hyprland =
    {
      config,
      lib,
      osConfig,
      pkgs,
      ...
    }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
      };
    };
}
