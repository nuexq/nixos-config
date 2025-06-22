{ ... }: {
  imports = [
    ./minecraft.nix # minecraft server
    ./jellyfin.nix  # jellyfin
    ./nfs.nix       # nfs server
  ];
}
