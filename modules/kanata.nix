{ config,
  lib,
  username,
  ...
}:

{
# Enable the uinput module
  boot.kernelModules = [ "uinput" ];

# Enable uinput
  hardware.uinput.enable = true;

# Set up udev rules for uinput
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
    '';

# Ensure the uinput group exists
  users.groups.uinput = { };

# Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
        "uinput"
    ];
  };

  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
# Replace the paths below with the appropriate device paths for your setup.
# Use `ls /dev/input/by-path/` to find your keyboard devices.
          "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
        ];
        extraDefCfg = "process-unmapped-keys yes";
        config = ''
          (defsrc
           caps tab d h j k l
          )
          (defvar
           tap-time 200
           hold-time 200
          )
          (defalias
           caps (tap-hold 200 200 esc lctl)
           tab (tap-hold $tap-time $hold-time tab (layer-toggle arrow))
           del del  ;; Alias for the true delete key action
          )
          (deflayer base
           @caps @tab d h j k l
          )
          (deflayer arrow
           _ _ @del left down up right
          )
          '';
      };
    };
  };
}
