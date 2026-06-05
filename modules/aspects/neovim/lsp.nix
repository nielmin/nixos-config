{
  nlm,
  ...
}: {
  nlm.neovim.lsp = {
    homeManager = {pkgs, ...}: {
      programs.nixvim = {
       lsp.servers.gopls = {
          enable = true;
          name = "gopls";
          config = {
            cmd = [ "gopls" ];
            filetypes = [
              "go"
              "gomod"
              "gowork"
              "gotmpl"
              "gosum"
            ];
            root_markers = [
              "go.mod"
              "go.work"
              ".git"
            ];
          };
        };
      };
    };
  };
}
