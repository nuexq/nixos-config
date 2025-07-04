{ ... }:

{
  services.miniflux = {
    enable = true;
    adminCredentialsFile = "/etc/miniflux_admin";

    config = {
      CREATE_ADMIN= "1";
      BASE_URL = "http://rss.nuexq.local";
      LISTEN_ADDR = "0.0.0.0:8067";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8067 ];
}

