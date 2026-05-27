{
  lib,
  den,
  ...
}: {
  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.aspects = {
    daniel = {
      includes = [
        den.provides.define-user
        den.provides.primary-user
        (den.provides.user-shell "fish")
        den.aspects.services
        den.aspects.security
        den.aspects.cli
        den.aspects.multimedia
        den.aspects.fish
      ];

      user.initialPassword = "changeme";

      nixos = {
        users.users.daniel.group = "daniel";
        users.groups.daniel = {};
      };
    };
    nuc = {
      includes = [
        den.provides.define-user
        den.provides.primary-user
        den.aspects.security
      ];
      user.hashedPassword = "$6$RkIPlT6IZxqyiuNG$u4ujjJEJe6kk7JHI.QaXSkwVYj8HBLKVm4Lr.I3DIHfyNsJqdWba.qajQRO.BPdq8e9fCoq58ROoexR/3F7hS.";
      nixos = {
        users.users.nuc = {
          group = "nuc";
          extraGroups = ["video"];
        };
        users.groups.nuc = {};
      };
    };
  };
}
