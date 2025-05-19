{ pkgs, ... }:

{
  programs.helix= {
    enable = true;

    settings = {
      theme = "tokyonight";

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
  };
}
