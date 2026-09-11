{ pkgs, ... }: {
  home.packages = (with pkgs; [
    nur.repos.trev.helium
  ]);
}
