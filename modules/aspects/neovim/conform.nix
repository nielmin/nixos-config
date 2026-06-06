{
  nlm,
  ...
}: {
  nlm.neovim.conform = {
    homeManager = {pkgs, ...}: {
      programs.nixvim = {
        plugins.conform-nvim = {
            enable = true;
            settings = { 
              formatters_by_ft = {
                go = [ "goimports" "gofumpt" ];
            };
          };
        };
      };
    };
  };
}
