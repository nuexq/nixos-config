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

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    nix-gaming.url = "github:fufexan/nix-gaming";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    catppuccin.url = "github:catppuccin/nix";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = { nixpkgs, self, ... }@inputs:
    let
      username = "nuexq";
      system = "x86_64-linux";
    in {
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
