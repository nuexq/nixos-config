{ pkgs, inputs, username, host, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [ ./../home inputs.catppuccin.homeModules.catppuccin ];

      home.username = username;
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;

      catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
        hyprlock.enable = false;
        swaync.enable = false;
        hyprland.enable = false;
        starship.enable = false;
        zsh-syntax-highlighting.enable = false;
      };
    };
  };

  users.users."${username}" = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nix.settings.allowed-users = [ username ];
}

