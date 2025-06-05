{ pkgs, config, ... }:

{
  catppuccin.mpv.enable = true;
  catppuccin.obs.enable = true;

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
    };

    obs-studio.enable = true;
  };
}
