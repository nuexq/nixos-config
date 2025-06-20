{ pkgs, username, inputs, host, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  networking.hostName = "tokita";

  networking.useDHCP = false;

  networking.interfaces.enp3s0.ipv4.addresses = [{
    address = "192.168.1.42";
    prefixLength = 24;
  }];

  networking.defaultGateway = "192.168.1.1";
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];

  networking.firewall.enable = true;
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

  environment.systemPackages = with pkgs; [ curl wget neovim ];

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

  system.stateVersion = "24.05";
}

