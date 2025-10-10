{
  flake.modules.nixos.users =
    { pkgs, ... }:
    {
      users.users.root = {
        isSystemUser = true;
        shell = pkgs.bash;
        initialPassword = "id";
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRkbcVwMaIfasq2qg6/ZsNz8i37JPUQHZJPBU6c80p1 root@vm"
        ];
      };
    };
}
