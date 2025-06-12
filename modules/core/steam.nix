{ pkgs, inputs, ... }: {
  imports = [ inputs.nix-gaming.nixosModules.platformOptimizations ];

  programs = {
    steam = {
      enable = true;

      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;

      gamescopeSession.enable = true;

      extraCompatPackages = [ pkgs.proton-ge-bin ];

      platformOptimizations.enable = true;
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [ libkrb5 keyutils ];
      };
    };

    gamescope = {
      enable = true;
      capSysNice = true;
      args = [ "--rt" "--expose-wayland" ];
    };
  };
}
