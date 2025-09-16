{
  flake.modules.homeManager.waybar = {
    catppuccin.waybar.enable = true;

    programs = {
      waybar = {
        enable = true;
      };
    };  
  };
}
