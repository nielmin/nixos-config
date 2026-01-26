{
  flake = {
    meta.users = {
      daniel = {
        name = "Daniel Hwang";
        username = "daniel";
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOo7qey0S5P0GgHBTGdZomCHq3zs6M43a/U5K/CwFGrq daniel@vm"
        ];
      };
      nuc = {
        name = "NUC";
        username = "nuc";
        authorizedKeys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEr1KZ+SFRgEcIwCLWMp4bUnyJYtEgUSsR9nBHWR6/Vh daniel@ines"
        ];
      };
    };
  };
}
