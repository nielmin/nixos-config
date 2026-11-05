{
  self,
  inputs,
  ...
}:
{
  flake.modules.nixos.users =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.user = {
        userName = lib.mkOption {
          type = lib.types.str;
          default = "daniel";
        };
      };

      config = { };
    };
}
