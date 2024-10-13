{ pkgs, ... }:
 
{
  imports = [
    ./vscode
    ./fish
    ./sway
    ./i3
    ./git
    ./ssh
    ./alacritty
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      browser = "firefox.desktop";
    in {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "application/pdf" = "zathura";
    };
  };

  xdg.configFile."mimeapps.list".force = true; # Force overwrite

  home.stateVersion = "20.09";
}
