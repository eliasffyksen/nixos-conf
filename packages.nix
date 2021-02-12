{ pkgs, ... }:

{
  # Common packages
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect

    # Development packages
    clang lldb llvm # Clang LLVM
    cmake extra-cmake-modules # CMake
    egl-wayland # Wayland code for dev
    pkg-config # PkgConfig for GLFW build
    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs # NodeJS
    docker-compose # Docker
    python3 # Python
    blender unity3d # Game Dev
    rstudio # R

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
    ranger termite firefox spotify discord pavucontrol
    i3status gimp chromium xclip teams libreoffice
  ];

  # Fonts
  fonts.fonts = with pkgs;
  [ font-awesome source-code-pro ];
  
  # Custom program configurations
  programs.sway.enable = true;
  programs.fish.enable = true;
  virtualisation.docker.enable = true;
}

