{ pkgs, ... }:

{
  catppuccin. enable = true;
  
  programs.helix= {
    enable = true;

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
  };
}
