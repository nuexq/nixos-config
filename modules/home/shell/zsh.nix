{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    plugins = [{
      # Must be before plugins that wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
      name = "fzf-tab";
      src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
    }];

    completionInit = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls $realpath'
    '';

    initContent = ''
      # exports
      export STARSHIP_CONFIG=~/.config/starship.toml
      export "MICRO_TRUECOLOR=1"

      # Make sure that the terminal is in application mode when zle is active, since
      # only then values from $terminfo are valid
      if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
        function zle-line-init() {
          echoti smkx
        }
        function zle-line-finish() {
          echoti rmkx
        }
        zle -N zle-line-init
        zle -N zle-line-finish
      fi

      # history
      HISTSIZE=5000
      HISTFILE=~/.zsh_history
      SAVEHIST=$HISTSIZE
      HISTDUP=erase
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups
      setopt hist_expire_dups_first
      setopt hist_verify

      # keybindings
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
