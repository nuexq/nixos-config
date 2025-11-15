{ pkgs, inputs, username, host, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../home ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
    # Allow backups when files conflict
    backupFileExtension = "bak";
  };

  users.users."${username}" = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ username ];
}

