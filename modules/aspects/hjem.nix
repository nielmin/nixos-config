{
  nlm,
    ...
}: {
  nlm.hjem = {
    hjem = { pkgs, lib, ... }: {
      user = "daniel";
      directory = "/home/daniel";
      files = {
        ".config/baz" = {
          generator = lib.generators.toJSON {};
          value = {
            some = "contents";
          };
        };
      };
    };
  };
}
