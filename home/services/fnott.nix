{ pkgs, ... }:

{
  services.fnott = {
    enable = true;
    settings = {
      main = {
        title-color  = "a6adc8ff";
        summary-color = "cdd6f4ff";
        body-color = "cdd6f4ff";
        background = "1e1e2eff";
        border-color = "89b4faff";
        progress-bar-color = "6c7086ff";
        max-timeout = 0;
        default-timeout = 0;
        idle-timeout = 0;
      };

      critical = {
        border-color = "A02F6Fff";
        title-color = "A02F6Fff";
        body-color = "ffffffff";
        summary-color = "AD8301ff";
        background = "000000ff";
      };
    };
  };
}
