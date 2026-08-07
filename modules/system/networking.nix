{ pkgs, ... }: {
  networking = {
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8" # Google Public DNS
      "8.8.4.4" # Google Public DNS
      "1.1.1.1" # Cloudflare DNS
    ];
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        80 # HTTP
        443 # HTTPS
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
