{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    shellAliases = {
      ls = "ls --color=auto --group-directories-first";
      ll = "ls -Ahl --color=auto --group-directories-first";
    };
    initExtra = ''
      PS1="\[\e[0;34m\]\u\[\e[0;33m\]@\[\e[0;35m\]\h\[\e[0;31m\] \[\e[0;36m\]\w \[\e[0;37m\]$ \[\e[0m\]"
    '';
    bashrcExtra = ''
      export PROMPT_DIRTRIM=2
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
