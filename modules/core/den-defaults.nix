{
  den.default = {
    nixos = {

      home-manager = {
        backupFileExtension = "bak";
        useGlobalPkgs = true;
        useUserPackages = true;
      };
    };
    homeManager = {
      programs.home-manager.enable = true;
    };
  };
}
