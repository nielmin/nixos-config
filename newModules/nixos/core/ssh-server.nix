{
  flake.modules.nixos.ssh-server = {
    services.openssh = {
      enable = true;

      settings.PasswordAuthentication = false;
    };

    users.users =
      {
        root.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRkbcVwMaIfasq2qg6/ZsNz8i37JPUQHZJPBU6c80p1 root@vm"

        ];

        daniel.openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOo7qey0S5P0GgHBTGdZomCHq3zs6M43a/U5K/CwFGrq daniel@vm"
        ];
      };
  };
}
