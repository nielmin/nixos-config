{ inputs, ... }:
{
  flake-file.inputs = {
    devshell.url = "github:numtide/devshell";
  };

  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem = { config, pkgs, ... }: {
    devshells.default = {
      commands = [
        {
          help = "print hello";
          name = "hello";
          command = "echo hello";
        }
      ];
      packages = with pkgs; [
        nh
      ];
    };
    formatter = pkgs.alejandra;
  };
}
