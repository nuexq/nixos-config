{ ... }: {
  imports = [
    ./minecraft.nix # minecraft server
    ./jellyfin.nix  # jellyfin
    ./samba.nix
  ];
}
