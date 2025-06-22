{ ... }: {
  imports = [
    ./minecraft.nix # minecraft server
    ./jellyfin.nix  # jellyfin
    ./media.nix
  ];
}
