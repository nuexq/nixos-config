{ inputs, config, ... }:
let
  pkgs = import inputs.nixpkgs {
    system = config.nixpkgs.system;
    overlays = [ inputs.nix-minecraft.overlay ];
  };
in {
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    servers.paper = {
      enable = true;
      jvmOpts = "-Xmx3G -Xms1G";
      enableReload = true;
      package = pkgs.paperServers.papermc-1_20_4;
    };
  };
}
