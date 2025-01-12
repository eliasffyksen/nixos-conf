{ pkgs, nvim-conf, ... }:
{
  home.file = {
    ".config/nvim" = {
      source = nvim-conf;
      recursive = true;
    };
  };
}
