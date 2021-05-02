{ pkgs, ... }:
 
{
  imports = [
    ./nvim
    ./vscode
    ./fish
    ./termite
    ./sway
    ./git
    ./ssh
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
