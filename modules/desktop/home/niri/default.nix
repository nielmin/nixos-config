{ inputs, ... }:
{
  flake.modules.homeManager.niri =
    { pkgs, ... }:
    {
      # nixpkgs.overlays = [
      #   inputs.niri-flake.overlays.niri
      # ];
      imports = [
        inputs.niri-flake.homeModules.niri
      ];
      programs.niri = {
        enable = true;
        settings.binds = {
          "XF86AudioRaiseVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"];
          "XF86AudioLowerVolume".action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
        };
      };    
    };
}
