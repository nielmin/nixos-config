{
  flake.modules.homeManager.shell = {
    programs.bash = {
      enable = true;
      bashrcExtra = "
        alias ll='ls -Ahl --group-directories-first --color=auto'
        ";
    };
  };
}
