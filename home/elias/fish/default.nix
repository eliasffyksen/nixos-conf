{ ... }:
{
    programs.fish = {
        enable = true;
        shellInit = ''
            fish_vi_key_bindings
            set -x TERM linux

            set -x EDITOR nvim
            set -x VISUAL nvim
            set -x _JAVA_AWT_WM_NONREPARENTING 1

            eval (ssh-agent -c)

            alias vi nvim
        '';
    };
}