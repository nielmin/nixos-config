{den, ...}: {
  den.aspects.octoprint = {
    nixos = {pkgs, ...}: {
      services = {
        mjpg-streamer = {
          enable = true;
          user = "mjpg-streamer";
          group = "video";
          inputPlugin = "input_uvc.so -d /dev/video0 -r 1920x1080 -f 30";
          outputPlugin = "output_http.so -w @www@ -n -p 5050";
        };

        octoprint = {
          enable = true;
          user = "nuc";
          group = "nuc";
          openFirewall = true;
          stateDir = "/home/nuc/.config/octoprint";
        };
      };
    };
  };
}
