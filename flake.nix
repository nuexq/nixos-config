{
  description = "nuexq's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "github:hyprwm/Hyprland";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    catppuccin.url = "github:catppuccin/nix";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions = {
      url = "github:vicinaehq/extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    { nixpkgs, self, ... }@inputs:
    let
      username = "nuexq";
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      myPkgs = import ./pkgs {
        inherit pkgs;
      };
    in
    {
      packages.${system} = myPkgs;

      nixosConfigurations = {
        NoPC = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/NoPC ];
          specialArgs = {
            host = "NoPC";
            inherit self inputs username;
          };
        };

        tokita = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/tokita ];
          specialArgs = {
            host = "tokita";
            inherit self inputs username;
          };
        };
      };
    };
}
