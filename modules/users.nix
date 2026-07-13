{
  lib,
  den,
  nlm,
  __findFile,
  ...
}: {
  den = {
    schema.user.classes = lib.mkDefault ["homeManager" "hjem"];

    aspects = {
      daniel = {
        host,
        user,
      }: {
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

        nixos = {config, ...}: {
          sops.secrets.userPass.neededForUsers = true;

          users.mutableUsers = true;
          users.users."${user.userName}" = {
            hashedPasswordFile = config.sops.secrets.userPass.path;
            group = "${user.userName}";
            extraGroups = [
              "video"
              "networkmanager"
              "uinput"
            ];
          };
          users.groups."${user.userName}" = {
            gid = 1000;
          };
        };

        hjem = {
          pkgs,
          lib,
          ...
        }: {
          user = "${user.userName}";
          directory = "/home/${user.userName}";
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
            extraGroups = [
              "video"
              "networkmanager"
            ];
          };
          users.groups.nuc = {};
        };
      };
    };
  };
}
