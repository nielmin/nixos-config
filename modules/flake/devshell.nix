{inputs, ...}: {
  flake-file.inputs = {
    devshell.url = "github:numtide/devshell";
  };

  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devshells.default = {
      env = [
        {
          name = "NH_OS_FLAKE";
          value = "/home/daniel/nixos-config";
        }
      ];

      commands = [
        {
          help = "rebuild local system";
          name = "rebuild";
          command = ''
            hostname=$1

            echo "=> Rebuilding local system '$hostname'"
            echo "nh os switch"
            nh os switch
          '';
        }

        {
          help = "rebuild remote system";
          name = "rebuild-remote";
          command = ''
            hostname=$1

            echo "=> Rebuilding system '$hostname'"
            echo "nix run nixpkgs#nixos-rebuild -- switch --flake .#$hostname --target-host $hostname --sudo"
            nix run nixpkgs#nixos-rebuild -- switch --flake .#$hostname --target-host $hostname --sudo
          '';
        }

        {
          help = "update flake.nix";
          name = "update";
          command = ''
            nix flake update
            nix run .#write-flake
            git add flake.*
            git commit -m 'nix flake update'
          '';
        }
      ];

      packages = with pkgs; [
        nh
        lua-language-server
        stylua
      ];
    };
    formatter = pkgs.alejandra;
  };
}
