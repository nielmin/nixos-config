{
  flakes.modules.nixos.users = {
    users = {
      mutableUsers = false;

      users = {
        root = {
          isSystemUser = true;
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQWWo40J1Sab/qD0MEJUhFRM6mJ1Ca9sM9vUxsBhdtv root@asta"
          ];
        };

        daniel = {
          isNormalUser = true;
          openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKmr//V3GIOxwtWLy/KU8Qnj7BaGqtUJratYpKqkWvy daniel@asta"
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOo7qey0S5P0GgHBTGdZomCHq3zs6M43a/U5K/CwFGrq daniel@vm"
          ];
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
