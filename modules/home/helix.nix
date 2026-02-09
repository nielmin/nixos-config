{
  flake.homeModules.helix =
    { config, ... }:
    {
      programs.helix = {
        enable = true;
        defaultEditor = false;

        settings = {
          theme = "mellow";
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
          language = [
            {
              name = "c";
              file-types = [ "keymap" ];
            }
          ];
        };
      };
    };
}
