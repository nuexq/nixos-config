{ pkgs, ... }: {
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };

    nameservers = [
      "1.1.1.1#one.one.one.one"
      "1.0.0.1#one.one.one.one"
      "8.8.8.8#dns.google"
      "8.8.4.4#dns.google"
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

  services.resolved = {
    enable = true;
    dnsovertls = "opportunistic";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1#one.one.one.one"
      "8.8.8.8#dns.google"
    ];
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
