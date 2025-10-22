{ inputs, ... }:
{
  flake.modules.nixos.catppuccin = {
    imports = [
      inputs.catppuccin.nixosModules.catppuccin
    ];
  };

  flake.modules.homeManager.catppuccin = {
    imports = [
      inputs.catppuccin.homeModules.catppuccin
    ];
    catppuccin = {
      hyprlock.enable = true;
      hyprland.enable = true;
      alacritty.enable = true;
      btop.enable = true;
      sway.enable = true;
      swaylock.enable = true;
      fuzzel.enable = true;
      waybar = {
        enable = true;
        mode = "createLink";
      };
      wlogout.enable = true;
    };
  };
}
