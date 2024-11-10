{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.unstable.vscode-extensions; [
      # ms-vscode.cpptools
    ];
  };
}
