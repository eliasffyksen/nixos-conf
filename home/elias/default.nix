{ pkgs, ... }:
 
{
  imports = [
    ./nvim
    ./vscode
    ./fish
    ./termite
  ];

  home.stateVersion = "20.09";
}
