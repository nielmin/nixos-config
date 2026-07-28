{nlm, ...}: {
  nlm.gfx-amd = {
    nixos = {pkgs, lib, ...}: {
      hardware = {
        graphics = {
          enable = true;
          enable32Bit = true;
        };
        amdgpu.overdrive.enable = true;
      };
      services.lact = {
        enable = true;
        package = pkgs.lact.override {
           libdisplay-info = pkgs.libdisplay-info.overrideAttrs (finalAttrs: {
              version = "0.3.0";
              src = pkgs.fetchFromGitLab {
                domain = "gitlab.freedesktop.org";
                owner = "emersion";
                repo = "libdisplay-info";
                rev = finalAttrs.version;
                sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
            };
         });
        };
      };
    };
  };
}

