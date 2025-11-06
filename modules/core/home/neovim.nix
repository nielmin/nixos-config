{ inputs, ... }:
{
  flake.modules.homeManager.core = {
      imports = [
        inputs.nixvim.homeModules.nixvim
      ];
      programs.nixvim = {
        enable = true;
        defaultEditor = true;
	viAlias = true;
	vimAlias = true;
    };
  };
}
