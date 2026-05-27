{den, ...}: {
  den.aspects.fish = {
    nixos = {pkgs, ...}: {};

    homeManager = {pkgs, ...}: {
      programs.fish = {
        enable = true;
	shellAbbrs = {
	  ls = "ls --color=auto --group-directories-first";
	  ll = "ls -ahl --color=auto --group-directories-first";
	};
	functions = {
	  bwf = {
	    argumentNames = [ "name" ];
	    body = "
	    set -f name $(rbw list | fzf --prompt='Vault > ')
            [ -n '$name' ] && rbw get '$namei | wl-copy -n --sensitive
            echo 'Copied Password: $name'
	  ";
	  };
	  bwft = {
	    argumentNames = [ "totp" ];
            body = "
	      set -f totp $(rbw list | fzf --prompt='Vault (TOTP) > ')
              [ -n '$totp' ] && rbw totp '$totp' | wl-copy -n --sensitive
              echo 'Copied TOTP: $totp'
	    ";
	  };
	};
      };
    };
  };
}
