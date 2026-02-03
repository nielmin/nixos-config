{
  flake.homeModules.mpv = {
    programs.mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
    };
  };
}
