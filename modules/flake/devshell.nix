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
          value = "/home/daniel/my-nix";
        }
      ];

      commands = [
        {
          help = "rebuild local system";
          name = "rebuild";
          command = ''
            hostname=$1

            echo "=> Rebuilding local system '$hostname'"
            echo "nixos-rebuild -- switch --flake .#$hostname"
            nixos-rebuild -- switch --flake .#$hostname
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
