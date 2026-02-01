{
  flake.modules.nixos.octoprint = {

    networking.firewall.allowedTCPPorts = [ 5050 ];

    services = {
      mjpg-streamer = {
        enable = true;
        user = "mjpg-streamer";
        group = "video";
        inputPlugin = "input_uvc.so -d /dev/video0 -r 1280x720 -f 30";
        outputPlugin = "output_http.so -w @www@ -n -p 5050";
      };

      octoprint = {
        enable = true;
        user = "daniel";
        group = "daniel";
        openFirewall = true;
        stateDir = "/home/daniel/.config/octoprint";
      };
    };
  };
}
