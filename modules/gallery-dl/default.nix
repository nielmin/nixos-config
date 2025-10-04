{
  flake.modules.homeManager.gallery-dl = {
    programs.gallery-dl = {
      enable = true;
      settings = {
        extractor.base-directory = "~/Downloads";
      };
    };
  };
}
