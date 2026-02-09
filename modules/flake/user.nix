{ self, ... }:
{
  config.flake.factory.user =
    username:
    let
      directory = "/home/${username}";
    in
    {
      nixos."${username}" =
        { pkgs, ... }:
        {
          users.users."${username}" = {
            isNormalUser = true;
            home = "${directory}";
            extraGroups = [
              "wheel"
              "networkmanager"
            ];
            shell = pkgs.fish;
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOo7qey0S5P0GgHBTGdZomCHq3zs6M43a/U5K/CwFGrq daniel@vm"
            ];
          };

          programs.fish.enable = true;

          home-manager.users."${username}" = {
            imports = [ self.modules.homeManager."${username}" ];
          };
        };

      homeManager."${username}" = {
        home = {
          username = "${username}";
          homeDirectory = "${directory}";
        };
      };
    };
}
