{
  flake.modules.homeManager.core = {
    programs = {
      bottom.enable = true;
      htop.enable = true;

      btop = {
        enable = true;

        settings = {
          update_ms = 1000;
          disks_filter = "";
          mem_graphs = false;
          proc_per_core = true;
        };
      };
    };
  };
}
