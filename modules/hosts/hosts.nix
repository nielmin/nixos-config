{
  den.schema.host = {
    host,
    lib,
    ...
  }: {
    options = {
      defaultUser = lib.mkOption {
        type = lib.types.str;
        default = "daniel";
        description = "Set default user of a host to 'daniel'";
      };

      isLaptop = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };

    config = {
      users.${host.defaultUser} = {};
    };
  };

  den.hosts.x86_64-linux = {
    asta = {};

    ines = {};

    liv = {
      hjem.enable = true;
      isLaptop = true;
    };

    nuc = {
      defaultUser = "nuc";
    };
  };
}
