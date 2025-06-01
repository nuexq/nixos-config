{ ... }:
{
  programs.fzf = {
    enable = true;

    enableZshIntegration = true;

    defaultCommand = "fd --hidden --strip-cwd-prefix --exclude .git";
    fileWidgetOptions = [
      "--preview 'if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi'"
    ];
    changeDirWidgetCommand = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
    changeDirWidgetOptions = [
      "--preview 'eza --tree --color=always {} | head -200'"
    ];

    ## Theme
    defaultOptions = [
      "--border='double' --border-label='' --preview-window='border-sharp' --prompt='> '"
      "--marker='>' --pointer='>' --separator='─' --scrollbar='│'"
      "--info='right'"
      "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8"
      "--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC"
      "--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8"
      "--color=selected-bg:#45475A"
      "--color=border:#313244,label:#CDD6F4"
    ];

  };
}
