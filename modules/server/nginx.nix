{ ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."rss.home.com" = {
      listen = [{
        addr = "192.168.1.8";
        port = 80;
      }];
      serverName = "rss.home.com";
      locations."/" = {
        proxyPass = "http://127.0.0.1:8067";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };
    };

    virtualHosts."jellyfin.home.com" = {
      listen = [{
        addr = "192.168.1.8";
        port = 80;
      }];
      serverName = "jellyfin.home.com";

      locations."/" = {
        proxyPass = "http://127.0.0.1:8096";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection $http_connection; # Needed for websockets
          # Prevent Nginx from caching Jellyfin responses
          proxy_cache_bypass $http_upgrade;
          proxy_buffering off;
          # Adjust timeouts for streaming
          proxy_read_timeout 3600s;
          proxy_send_timeout 3600s;
          send_timeout 3600s;
        '';
      };
    };

  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}

