{nlm, inputs, ...}: {
  nlm.neovim = {
    homeManager = {pkgs, ...}: {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
      };
    };
  };
}
