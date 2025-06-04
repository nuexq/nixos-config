{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = with pkgs; [ darkly-qt5 darkly ];
      name = "kvantum";
    }
  };
}
