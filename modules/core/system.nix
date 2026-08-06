{ pkgs, inputs, ... }:
{
  nix = {
    package = pkgs.lixPackageSets.stable.lix;
    settings = {
      cores = 12;
      max-jobs = "auto";
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://nix-community.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://ghostty.cachix.org"
        "https://vicinae.cachix.org"
        "https://niri.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
        "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
        "niri.cachix.org-1:W43zgB3vSjaGeM+zCXtM220y4WBCTMEdK5nyvB+MY4Y="
      ];
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
      inputs.rust-overlay.overlays.default
      inputs.niri.overlays.niri
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    sshfs
    comma
  ];

  time.timeZone = "Africa/Casablanca";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}
