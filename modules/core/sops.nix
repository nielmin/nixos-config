{ inputs, ... }: {
  flake.modules.nixos.sops = { pkgs, ... }: {

    sops = {
      defaultSopsFile = ../../.sops.yaml;
      age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

      secrets = {
        "userPass" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "userPass";
        };
        "nucPass" = {
          sopsFile = ../../secrets/secrets.yaml;
          key = "nucPass";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      sops
      age
      ssh-to-age
      ssh-to-pgp
    ];
  };
}
