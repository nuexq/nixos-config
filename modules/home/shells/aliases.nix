{ ... }: {

  home.shellAliases = {
    # Utilities
    cd = "z";
    cat = "bat";
    diff = "delta --diff-so-fancy --side-by-side";
    less = "bat";
    pdf = "tdf";
    open = "xdg-open";
    man = "BAT_THEME='default' batman";

    # Navigation / listing
    c = "clear";
    l = "eza -lh --icons=auto";
    ll = "eza -lha --icons=auto --sort=name --group-directories-first";
    ls = "eza -1 --icons=auto";
    ld = "eza -lhD --icons=auto";
    nv = "nvim";

    # Nomad / nix helpers
    ns = "nom shell";
    nd = "nom develop --command fish";
    nb = "nom build";
    nix-switch = "nh os switch";
    nix-update = "nh os switch --update";
    nix-clean = "nh clean all --keep 5";
    nix-search = "nh search";
    nix-test = "nh os test";
  };
}
