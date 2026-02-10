{
  flake.modules.homeMananger.git = {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "Daniel Hwang";
            email = "daniel@asta.lan";
          };
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
