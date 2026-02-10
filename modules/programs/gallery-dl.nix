{
  flake.modules.homeMananger.gallery-dl = {
    programs.gallery-dl = {
      enable = true;
      settings = {
        extractor.base-directory = "~/Downloads";
      };
    };
  };
}
