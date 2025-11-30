{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      # Disable greeting
      set -g fish_greeting

      # Key bindings
      bind \cp history-token-search-backward
      bind \cn history-token-search-forward
    '';

    functions = {
      bj = "nohup $argv </dev/null &>/dev/null &";
      "." = ''
        set -l input $argv[1]
        if echo $input | grep -q '^[1-9][0-9]*$'
          set -l levels $input
          for i in (seq $levels)
            cd ..
          end
        else
          echo "Invalid input format. Please use '<number>' to go back a specific number of directories."
        end
      '';
    };

    plugins = [{
      name = "plugin-git";
      src = pkgs.fishPlugins.plugin-git.src;
    }];
  };
}
