{ config,
  agenix,
  ...
}:
{
  users.users = {
    root = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQWWo40J1Sab/qD0MEJUhFRM6mJ1Ca9sM9vUxsBhdtv root@asta"
      ];
    };
    daniel = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHKmr//V3GIOxwtWLy/KU8Qnj7BaGqtUJratYpKqkWvy daniel@asta"
      ];
      isNormalUser = true;
    };
  };
}
