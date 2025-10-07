{
  flake.modules.homeManager.shell = {
    programs.bash = {
      enable = true;
      bashrcExtra = "
          export EDITOR=/usr/bin/nvim
          export VISUAL=$EDITOR
        ";
    };
  };
}
