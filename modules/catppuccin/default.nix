{ inputs, ... }:
{
  flake.modules.homeManager.catppuccin = {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];
    catppuccin = {
      hyprlock.enable = true;
      hyprland.enable = true;
      alacritty.enable = true;
      btop.enable = true;
      helix.enable = true;
      sway.enable = true;
      swaylock.enable = true;
      yazi.enable = true;
      waybar.enable = true;
    };
  };
}
