{
  flake.modules.homeManager.core = {
    programs.bash = {
      enable = true;
      bashrcExtra = "
        alias ll='ls -Ahl --group-directories-first --color=auto'
        ";
    };

    programs.fish = {
      enable = true;
    };
  };
}
