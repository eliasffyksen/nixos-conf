{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git ncdu gotop htop tree killall

    # Development packages
    clang lldb # Clang LLVM
    gnumake gcc gdb # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs # NodeJS
    docker docker-compose # Docker

    # User applications
    mako libnotify # Notification center
    ranger termite firefox spotify discord pavucontrol
    i3status gimp
  ];
}

