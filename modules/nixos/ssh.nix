{
  flake.nixosModules.nix = {
    services.openssh = {
      enable = true;

      settings.PasswordAuthentication = true;
    };
  };
}
