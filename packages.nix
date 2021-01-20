{ pkgs, ... }:

{
  # Common packages
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git ncdu gotop htop tree killall

    # Development packages
    clang lldb # Clang LLVM
    gnumake gcc gdb # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs # NodeJS
    docker-compose # Docker

    # User applications
    mako libnotify # Notification center
    ranger termite firefox spotify discord pavucontrol
    i3status gimp
  ];

  # Fonts
  fonts.fonts = with pkgs;
  [ font-awesome source-code-pro ];
  
  # Custom program configurations
  programs.sway.enable = true;
  programs.fish.enable = true;
  virtulization.docker.enable = true;
}

