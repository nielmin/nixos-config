{ inputs, ... }:
{
  flake.modules.homeManager.catppuccin = {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];
    catppuccin.hyprlock.enable = true;
    catppuccin.hyprland.enable = true;
  };
}
