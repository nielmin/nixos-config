{
  flake.modules.homeManager.core = {
    programs = {
      git = {
        enable = true;
        userName = "Daniel Hwang";
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
