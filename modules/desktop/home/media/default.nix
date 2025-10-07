{
  flake.modules.homeManager.desktop.media = {
    programs.mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
    };
    programs.obs-studio = {
      enable = true;
    };
  };
}
