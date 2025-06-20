{ pkgs, username, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  home.packages = with pkgs; [ btop tmux ];

  # Import your server-specific home config if you want, else configure here directly
  # imports = [ ./../../modules/home/server ];
}

