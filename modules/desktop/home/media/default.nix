{
  flake.modules.homeManager.desktop = {
    programs.mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
    };
    programs.obs-studio = {
      enable = true;
    };
  };
}
