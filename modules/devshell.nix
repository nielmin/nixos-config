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
      env = [
        {
	  name = "NH_OS_FLAKE";
	  value = "/home/daniel/my-nix";
	}
      ];
      commands = [
        {
          help = "nh os switch . -H myHost";
          name = "switch";
          command = "nh os switch . -H asta";
        }

        {
          help = "nh clean";
          name = "clean";
          command = "nh clean";
        }
      ];
      packages = with pkgs; [
        nh
      ];
    };
    formatter = pkgs.alejandra;
  };
}
