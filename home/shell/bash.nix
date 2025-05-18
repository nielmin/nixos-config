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
    profileExtra = ''
    . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
