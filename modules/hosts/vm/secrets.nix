{ self, ... }:
{
  flake.modules.nixos.vm = {
    age.secrets = {
      userpass.file = "${self}/secrets/userpass.age";
    };
  };
}
