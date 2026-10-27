{
  nlm.fish = {
    nixos = { };

    homeManager = {
      programs.fish = {
        enable = true;
        shellAbbrs = {
          cat = "bat";
          ls = "ls --color=auto --group-directories-first";
          ll = "ls -ahl --color=auto --group-directories-first";
        };
        shellAliases = { };
        shellInit = ''
          set -g fish_greeting
          fish_add_path "/home/daniel/.local/bin"
        '';
        functions = {
          fish_prompt = {
            body = "set -l last_status $status
            set -l stat
            if test $last_status -ne 0
                set stat (set_color red)\"[$last_status]\"(set_color normal)
            end
            string join '' -- $stat (set_color yellow) $hostname ' ' (set_color blue) (prompt_pwd --full-length-dirs 1) (set_color normal) ' '";
          };
        };
      };
    };
  };
}
