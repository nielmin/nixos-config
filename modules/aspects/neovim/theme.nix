{ nlm, ... }: {
  nlm.neovim.theme = {
    homeManager = {pkgs, ...}: {
      programs.nixvim = {
        extraPlugins = with pkgs; [
           vimPlugins.koda-nvim
        ];
        extraConfigLua = ''
          require('koda').setup()
          vim.cmd("colorscheme koda")
        '';
      };
    };
  };
}
