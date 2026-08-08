{ ... }: {
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidget.options = [
      "--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
    ];
    changeDirWidget = {
      options = [ "--preview 'eza --tree --color=always {} | head -200'" ];
      command = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    };
  };
}
