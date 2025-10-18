{ inputs, ... }:
{
  imports = [
    inputs.devshell.flakeModule
  ];

  perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    {
      devshells.default = {
        commands = [
          {
            name = "update";
            command = ''
              echo "=> Updating flake inputs"
              nix flake update

              git add flake.lock
              git commit -m "Update flake.lock"
              git push
            '';
          }
          {
            name = "rebuild";
            command = ''
              hostname=$1

              echo "=> Rebuilding system '$hostname'"
              echo "sudo nixos-rebuild switch --flake .#$hostname --upgrade"
              sudo nixos-rebuild switch --flake .#$hostname --upgrade
            '';
          }
        ];
      };
    };
}
