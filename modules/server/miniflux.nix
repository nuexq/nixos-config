{ ... }:

{
  services.miniflux = {
    enable = true;
    adminCredentialsFile = "/etc/miniflux.env";

    config = {
      BASE_URL = "http://192.168.1.10:8067";
      LISTEN_ADDR = "0.0.0.1:8067";
      METRICS_COLLECTOR = "1";
      DISABLE_LOCAL_AUTH = false;
    };
  };

  networking.firewall.allowedTCPPorts = [ 8067 ];
}

