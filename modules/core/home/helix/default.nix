{
  flake.modules.homeManager.core =
    { config, ... }:
    {
      programs.helix = {
        enable = true;
        defaultEditor = true;

        settings = {
          editor = {
            line-number = "relative";
            lsp.display-messages = true;
          };

          keys.normal = {
            space.space = "file_picker";
            space.w = ":w";
            space.q = ":q";
          };
        };

        languages = {
          language = [{
            name = "c";
            file-types = ["keymap"];
          }];
          
        };
      };
    };  
}
