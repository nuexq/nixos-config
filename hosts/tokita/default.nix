{ ... }:

{
  imports = [
    ./system.nix

    # Add service configs from modules
    ../../modules/server/

    # Add other custom modules here
  ];
}
