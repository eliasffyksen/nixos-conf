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

  home.stateVersion = "20.09";
}
