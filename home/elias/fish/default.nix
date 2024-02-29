{ ... }:
{
    programs.fish = {
        enable = true;
        shellInit = ''
            fish_vi_key_bindings
            set -x TERM xterm

            set -x EDITOR nvim
            set -x VISUAL nvim
            set -x _JAVA_AWT_WM_NONREPARENTING 1
            set -x PATH $HOME/.local/bin $PATH

            eval (ssh-agent -c)

            alias vi nvim
            alias vim nvim
        '';
    };
}
