{
  flake.modules.homeManager.core = {
    programs = {
      git = {
        enable = true;
        userName = "Daniel Hwang";
        userEmail = "daniel@asta.lan";
        extraConfig = {
          init.defaultBranch = "main";
        };
      };

      gh = {
        enable = true;

        settings = {
          git_protocol = "ssh";
        };
      };
    };
  };
}
