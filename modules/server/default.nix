{ ... }: {
  imports = [
    ./minecraft.nix # minecraft server
    ./jellyfin.nix  # jellyfin
    ./miniflux.nix  # rss reader
  ];
}
