{ pkgs, username, ... }:

{
  imports = [ ../../modules/core/bootloader.nix ../../modules/core/nh.nix ];
  networking.hostName = "tokita";

  # networking
  # Use static IP or DHCP
  networking.useDHCP = false;
  networking.interfaces.wlo1.ipv4.addresses = [{
    address = "192.168.1.8";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "192.168.1.1" "8.8.8.8" ];
  networking.firewall.allowedUDPPorts = [ 53 ];
  networking.firewall.allowedTCPPorts = [ 22 53 ];

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  # Timezone, locale
  time.timeZone = "Africa/Casablanca";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable OpenSSH
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;

  # Define your user
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ neovim btop htop git curl tmux ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow sudo for wheel group
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Enable ZSH
  programs.zsh.enable = true;

  # lAN-wide dns
  services.dnsmasq = {
    enable = true;
    settings = {
      address = [
        "/nuexq.local/192.168.1.8"
        "/rss.nuexq.local/192.168.1.8"
        "/jellyfin.nuexq.local/192.168.1.8"
      ];
    };
  };

  system.stateVersion = "24.05";
}
