{ pkgs, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.spicetify
  ];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      keyboardShortcut
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
