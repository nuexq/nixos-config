{ ... }:
{
  security = {
    rtkit.enable = true;
    sudo.enable = true;
    pam.services.hyprlock = { };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
}
