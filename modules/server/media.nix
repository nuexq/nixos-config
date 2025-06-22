{ config, ... }:

let
  # Download client config path
  qbittorrentConfig = "/var/lib/qbittorrent/config/qbittorrent.conf";
in
{
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

  services.qbittorrent = {
    enable = true;
    # Config path for qBittorrent, will be created automatically if missing
    config = qbittorrentConfig;
    # Set download directory for completed downloads
    downloadsDir = "/srv/media/downloads";
    user = "nuexq";
    group = "users";
    # Optional: enable web-ui for remote control
    webUiEnable = true;
  };

  # Make sure these directories exist and permissions are correct:
  systemd.tmpfiles.rules = [
    "d /srv/media/radarr 0755 nuexq users -"
    "d /srv/media/sonarr 0755 nuexq users -"
    "d /srv/media/bazarr 0755 nuexq users -"
    "d /srv/media/downloads 0755 nuexq users -"
  ];

  # Firewall ports open for these services
  networking.firewall.allowedTCPPorts = with config.networking.firewall.allowedTCPPorts or []; [
    7878  # Radarr
    8989  # Sonarr
    6767  # Bazarr
    8080  # qBittorrent web UI
  ];

  # Optional: User should be in appropriate groups for permissions
  users.users.nuexq.extraGroups = (config.users.users.nuexq.extraGroups or []) ++ [ "users" "networkmanager" "video" ];
}
