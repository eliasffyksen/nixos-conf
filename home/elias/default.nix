{ pkgs, ... }:
 
{
  imports = [
    ./nvim
    ./vscode
  ];

  home.stateVersion = "20.09";
}
