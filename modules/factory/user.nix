{
  self,
  ...
}:
{
  config.flake.factory.user = username: isAdmin: {

    nixos."${username}" =
      {
        lib,
        pkgs,
        ...
      }:
      {
        sops.secrets.userPass.neededForUsers = true;

        users.users."${username}" = {
          isNormalUser = true;
          home = "/home/${username}";
          extraGroups = lib.optionals isAdmin [
            "wheel"
          ];
          shell = pkgs.fish;
        };
        programs.fish.enable = true;

        home-manager.users."${username}" = {
          imports = [
            self.modules.homeManager."${username}"
          ];
        };
      };

    homeManager."${username}" = {
      home.username = "${username}";
    };
  };
}
