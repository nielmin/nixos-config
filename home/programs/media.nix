{ pkgs, config, ... }:

{
  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
    };

    obs-studio.enable = true;
  };
}
