{
  flake.homeModules.gallery-dl = {
    programs.gallery-dl = {
      enable = true;
      settings = {
        extractor.base-directory = "~/Downloads";
      };
    };
  };
}
