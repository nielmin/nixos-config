{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

      users = {
        root = {
          isSystemUser = true;
        };

        daniel = {
          isNormalUser = true;
          uid = 1000;

          group = "daniel";

          extraGroups = [
            "wheel"
            "networkmanager"
          ];

        };
      };

      groups = {
        daniel.gid = 1000;
      };      
    };
  };
}
