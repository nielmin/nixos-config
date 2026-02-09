{
  flake.modules.homeManager.mpv = {
    programs.mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
    };
  };
}
