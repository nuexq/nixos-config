{ pkgs, username, config, inputs, host, ... }: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-minecraft.nixosModules.minecraft-servers
    inputs.nixarr.nixosModules.default
  ];
  networking.hostName = "tokita";

  networking.useDHCP = false;

  networking.interfaces.wlo1.ipv4.addresses = [{
    address = "192.168.1.42";
    prefixLength = 24;
  }];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 8096 139 445 137 138 ];
    allowedUDPPorts = [ 3702 ];
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Casablanca";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    homeMode = "700";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
    packages = with pkgs; [ git ];
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = true;
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
    neovim
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  security.sudo.wheelNeedsPassword = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./home.nix ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";

      programs.home-manager.enable = true;
    };
  };

  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  system.stateVersion = "24.05";

  # jellyfin
  services.jellyfin.enable = true;

  # samba
  services.samba = {
    enable = true;
    openFirewall = true;

    settings = {
      global = {
        workgroup = "WORKGROUP";
        "server string" = config.networking.hostName;
        "netbios name" = config.networking.hostName;
        "security" = "user";
        "invalid users" = [ "root" ];
        "guest account" = "nobody";
        "map to guest" = "bad user";
        "passdb backend" = "tdbsam";
        "hosts allow" = "192.168.1.8/24";
      };

      shared = {
        path = "/home/${username}/shared";
        "browseable" = "yes";
        "writeable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = username;
        "vfs objects" = "catia fruit streams_xattr";
        "fruit:aapl" = "yes";
      };
    };
  };
}

