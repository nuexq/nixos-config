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
      "--color=fg:#cad3f5,fg+:#b7bdf8,bg:#24273a,bg+:#363a4f"
      "--color=hl:#8aadf4,hl+:#91d7e3,info:#a6da95,marker:#ed8796"
      "--color=prompt:#f5a97f,spinner:#8bd5ca,pointer:#ed8796,header:#c6a0f6"
      "--color=border:#363a4f,label:#b7bdf8,query:#cad3f5"
      "--border='double' --border-label='' --preview-window='border-sharp' --prompt='> '"
      "--marker='>' --pointer='>' --separator='─' --scrollbar='│'"
      "--info='right'"
    ];

  };
}
