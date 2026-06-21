{
  nlm,
  inputs,
  __findFile,
  ...
}: {
  nlm.nvim = {
    nixos = { pkgs, lib, config, ...}: {
      imports = [
        inputs.nix-wrapper-modules.nixosModules.neovim
      ];

      wrapperModules.neovim = {
        enable = true;
        package = pkgs.neovim-unwrapped;

        settings = {
          dont_link = false;
          compile_generated_lua = true;
        };
      };
    };

    homeManager = {pkgs, ...}: {};
  };
}
