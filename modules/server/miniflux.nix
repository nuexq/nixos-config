{ ... }:

{
  services.miniflux = {
    enable = true;

    # Provide this file with:
    adminCredentialsFile = /var/lib/miniflux/admin.env;

    config = {
      BASE_URL =
        "http://192.168.1.8:8067";
      CREATE_ADMIN = "1";
      LISTEN_ADDR = "0.0.0.0:8067";

      DISABLE_LOCAL_AUTH = "false";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8067 ];
}

