{ lib, ... }: {

  options.flake.factory = lib.mkOption {
    type = lib.types.attrListOf lib.types.unspecified;
    default = { };
  };
}
