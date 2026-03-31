{
  den.hosts.x86_64-linux = {
    asta.users.daniel = { };
    asta.users.daniel.classes = [ "homeManager" ];
    # host provides default home environment for its users
    # homeManager =
    #   { pkgs, ... }:
    #   {
    #     home.packages = [ pkgs.vim ];
    #   };
  };
}
