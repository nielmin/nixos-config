{
  flake.modules.homeManager.utils =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        ripgrep
        jq
        eza
        fzf
        zoxide
        gnumake
      ];
    };
}
