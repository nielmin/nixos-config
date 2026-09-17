{
  nlm,
  inputs,
  ...
}: {
  nlm.sops = {
    nixos = {pkgs, ...}: {
      # temporarily fixes sops-nix, see:
      # https://github.com/Mic92/sops-nix/issues/983
      nixpkgs.overlays = [
        (final: prev: {
          buildGo125Module = prev.buildGoModule;
        })
      ];

      imports = [
        inputs.sops-nix.nixosModules.sops
      ];

      sops = {
        defaultSopsFile = ../../.sops.yaml;
        age.sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];

        secrets = {
          "samba" = {
            sopsFile = ../../secrets/secrets.yaml;
            key = "samba";
            owner = "root";
          };
          "userPass" = {
            sopsFile = ../../secrets/secrets.yaml;
            key = "userPass";
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
  };
}
