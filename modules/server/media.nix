{ config, ... }: {
  services.radarr = {
    enable = true;
    dataDir = "/srv/media/radarr";
    user = "nuexq";
    group = "users";
  };

  services.sonarr = {
    enable = true;
    dataDir = "/srv/media/sonarr";
    user = "nuexq";
    group = "users";
  };

  services.bazarr = {
    enable = true;
    dataDir = "/srv/media/bazarr";
    user = "nuexq";
    group = "users";
  };

  services.transmission = {
    enable = true;
    user = "nuexq";
    rpc = {
      enabled = true;
      username = "your_rpc_username"; # change this
      password = "your_rpc_password"; # change this
      whitelistEnabled = false; # allow any IP, or customize
      port = 9091;
    };
    downloadDir = "/srv/media/downloads";
  };

  # Make sure these directories exist and permissions are correct:
  systemd.tmpfiles.rules = [
    "d /srv/media/radarr 0755 nuexq users -"
    "d /srv/media/sonarr 0755 nuexq users -"
    "d /srv/media/bazarr 0755 nuexq users -"
    "d /srv/media/downloads 0755 nuexq users -"
  ];

  # Firewall ports open for these services
  networking.firewall.allowedTCPPorts =
    with config.networking.firewall.allowedTCPPorts or [ ]; [
      7878 # Radarr
      8989 # Sonarr
      6767 # Bazarr
      9091 #  # Transmission Web UI
    ];

  # Optional: User should be in appropriate groups for permissions
  users.users.nuexq.extraGroups = (config.users.users.nuexq.extraGroups or [ ])
    ++ [ "users" "networkmanager" "video" ];
}
