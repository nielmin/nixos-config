{nlm, ...}: {
  nlm.fish = {
    nixos = {pkgs, ...}: {};

    homeManager = {pkgs, ...}: {
      programs.fish = {
        enable = true;
        shellAbbrs = {
          ls = "ls --color=auto --group-directories-first";
          ll = "ls -ahl --color=auto --group-directories-first";
        };
        shellInit = "set -g fish_greeting";
        functions = {
          fish_prompt = {
            body = "set -l last_status $status
            set -l stat
            if test $last_status -ne 0
                set stat (set_color red)\"[$last_status]\"(set_color normal)
            end
            string join '' -- $stat (set_color yellow) $hostname ' ' (set_color blue) (prompt_pwd --full-length-dirs 1) (set_color normal) ' '";
          };
          bwf = {
            body = "set -f name $(rbw list | fzf --prompt=\"Vault > \")
            [ -n \"$name\" ] && rbw get \"$name\" | wl-copy -n --sensitive
            echo \"Copied \"$name\"\" Password";
          };
          bwft = {
            body = "set -f totp $(rbw list | fzf --prompt=\"Vault (TOTP) > \")
              [ -n \"$totp\" ] && rbw totp \"$totp\" | wl-copy -n --sensitive
              echo \"Copied $totp\" TOTP";
          };
        };
      };
    };
  };
}
