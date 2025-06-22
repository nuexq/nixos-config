{ pkgs, username, ... }:

{
  imports = [ ../../modules/core/bootloader.nix ../../modules/core/nh.nix ];
  networking.hostName = "tokita";

  # Use static IP or DHCP
  networking.useDHCP = false;
  networking.interfaces.wlo0.ipv4.addresses = [{
    address = "192.168.1.8";
    prefixLength = 24;
  }];
  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Timezone, locale
  time.timeZone = "Africa/Casablanca";
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable OpenSSH
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;

  # Define your user
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ neovim btop htop git ];
  };

  # Allow sudo for wheel group
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  # Enable ZSH
  programs.zsh.enable = true;

  system.stateVersion = "24.05";
}
