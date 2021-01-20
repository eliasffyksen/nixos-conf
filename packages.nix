{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget curl gnupg git ncdu gotop htop tree killall

    clang lldb
    gnumake gcc gdb
    ghc cabal-install

    ranger termite firefox spotify discord pavucontrol
    i3status gimp
    mako libnotify
  ];
}

