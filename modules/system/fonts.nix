{ pkgs, self, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    inter-nerdfont
    ioskeley-mono.term-nf
    self.packages.${pkgs.stdenv.hostPlatform.system}.deserted-font
  ];

  fonts.fontconfig.enable = true;
}
