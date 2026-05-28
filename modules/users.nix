{
  lib,
  den,
  nlm,
  __findFile,
  ...
}: {
  den.schema.user.classes = lib.mkDefault ["homeManager"];

  den.aspects = {
    daniel = {
      includes = [
        <den.provides.define-user>
        <den.provides.primary-user>
        (den.provides.user-shell "fish")
        <nlm/services>
        <nlm/security>
        <nlm/cli>
        <nlm/multimedia>
        <nlm/fish>
        <nlm/dev>
        <nlm/neovim>
      ];

      user.initialPassword = "changeme";

      nixos = {
        users.users.daniel.group = "daniel";
        users.groups.daniel = {};
      };
    };
    nuc = {
      includes = [
        <den.provides.define-user>
        <den.provides.primary-user>
        <nlm/security>
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
