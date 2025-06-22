{ ... }:

{
  imports = [
    ./system.nix

    # Add service configs from modules
    #../../modules/jellyfin.nix

    # Add other custom modules here
  ];
}
