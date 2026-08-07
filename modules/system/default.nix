{ ... }:

{
  imports = [
    ./bootloader.nix
    ./flatpak.nix
    ./keyd.nix
    ./networking.nix
    ./nh.nix
    ./wayland.nix
    ./pipewire.nix
    ./security.nix
    ./services.nix
    ./sddm.nix
    ./spicetify.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./nix.nix
    ./xserver.nix
  ];
}
