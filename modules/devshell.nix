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
          help = "nh os switch";
          name = "switch";
          command = "nh os switch";
        }

        {
          help = "clean all profiles";
          name = "clean";
          command = "nh clean all";
        }

        {
          help = "nix run .#write-flake";
          name = "write-flake";
          command = "nix run .#write-flake";
        }
      ];
      packages = with pkgs; [
        nh
      ];
    };
    formatter = pkgs.alejandra;
  };
}
