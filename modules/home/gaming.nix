{ pkgs, ... }: {
  home.packages = with pkgs; [
    mangohud # monitoring fps
    umu-launcher # proton outside steam
    nur.repos.${"0komo"}.sklauncher # sklauncher
    shipwright # ship of harkinian
    lumafly
  ];
}
