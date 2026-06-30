{ pkgs, ... }: {
  home.packages = (with pkgs; [
    nur.repos.${"Ev357"}.helium
  ]);
}
