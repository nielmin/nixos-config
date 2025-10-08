{ inputs, ... }:
{
  flake.modules.homeManager.niri = {
    imports = [
      inputs.niri-flake.homeModules.niri
    ];
    programs.niri = {
      enable = true;
    };    
  };
}
