{ ... }:

{
  services.miniflux = {
    enable = true;
    adminCredentialsFile = "/etc/miniflux.env";

    config = {
      CREATE_ADMIN= "1";
      BASE_URL = "http://192.168.1.8:8067";
      LISTEN_ADDR = "0.0.0.1:8067";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8067 ];
}

