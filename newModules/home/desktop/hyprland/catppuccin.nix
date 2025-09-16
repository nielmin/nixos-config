{
  flake.modules.homeManager.hyprland = {
    { pkgs, catppuccin, ... }:

    {   
    catppuccin.hyprlock.enable = true;
    catppuccin.hyprland.enable = true;
    };
  };
}
