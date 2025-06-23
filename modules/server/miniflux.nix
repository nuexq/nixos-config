{ ... }:

{
  services.miniflux = {
    enable = true;
    adminCredentialsFile = "/etc/miniflux_adming";

    config = {
      CREATE_ADMIN= "1";
      BASE_URL = "http://rss.home.com";
      LISTEN_ADDR = "0.0.0.0:8067";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8067 ];
}

