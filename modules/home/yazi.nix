{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
  };

  xdg.configFile."yazi/config.toml".text = ''
    [open]
    text = "nvim"
    image = "imv"

    pdf = "zathura"
    video = "mpv"
  '';
}
