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
        users.users."${username}" = {
          isNormalUser = true;
          home = "/home/${username}";
          extraGroups = lib.optionals isAdmin [
            "wheel"
          ];
          shell = pkgs.fish;
        };
        users.groups.${username} = { };

        programs.fish.enable = true;

        home-manager.users."${username}" = {
          imports = [
            self.modules.homeManager."${username}"
          ];
          programs.home-manager.enable = true;
        };
      };

    homeManager."${username}" = {
      home.username = "${username}";
    };
  };
}
