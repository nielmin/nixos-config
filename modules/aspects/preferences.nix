{
  flake.modules.nixos.preferences = { lib, ... }: {
    options.preferences = {
      user.name = lib.mkOption {
        type = lib.types.str;
        default = "daniel";
        description = "Global primary system username.";
      };
    };
  };
}
