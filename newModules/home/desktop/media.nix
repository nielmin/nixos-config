{
  flake.modules.homeManager.media = {
    programs.mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
    };
    programs.obs = {
      enable = true;
    };
  };
}
