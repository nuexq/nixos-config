{ ... }:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      cd = "z";
      cat = "bat";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      pdf = "tdf";
      open = "xdg-open";
      man = "BAT_THEME='default' batman";

      c = "clear"; # clear terminal
      l = "eza -lh  -icons=auto"; # long list
      ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
      ls = "eza -1   --icons=auto"; # short list
      ld = "eza -lhD --icons=auto"; # long list dirs
      nv = "nvim"; # nvim

      # Nixos
      ns = "nom-shell --run zsh";
      nd = "nom develop --command zsh";
      nb = "nom build";
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";

      # Handy change dir shortcuts
      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";
    };
  };
}
