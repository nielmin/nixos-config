{...}: {
  systems = ["x86_64-linux"];
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        nh
        lua-language-server
        stylua
      ];
    };

    formatter = pkgs.alejandra;
  };
}
