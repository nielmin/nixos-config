{ pkgs, ... }:

{
  # basic configuration of git, please change to your own
  programs = {
    git = {
      enable = true;
      userName = "Daniel Hwang";
      userEmail = "daniel@asta.nix";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    gh.enable = true;
  };
}
