{ pkgs, ... }:
let
  python3WithPackages = pkgs.python3.withPackages(p: with p; [
    compiledb
    jedi
    jupyterlab
    matplotlib
    numpy
    pandas
    pylint
    scipy
    scikitlearn
    pygame
    pycodestyle
  ]);
in
{
  # Common packages
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect traceroute inetutils sshpass

    # Development packages
    clang_11 lld_11 lldb_11 llvm_11 llvmPackages.bintools # Clang LLVM
    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs # JavaScript TypeScript
    nodePackages.typescript
    docker-compose # Docker
    python3WithPackages
    blender # Game Dev
    rstudio jupyter # R
    mongodb
    rustc

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
    ranger termite firefox spotify discord pavucontrol steam
    i3status gimp chromium xclip teams libreoffice jetbrains.idea-community
    wireshark

    # Local pkgs
    (callPackage (import ./pkgs/hello) {})
  ];

  # JAVA
  programs.java = {
    enable = true;
    package = pkgs.openjdk11;
  };

  # Fonts
  fonts.fonts = with pkgs;
  [ font-awesome source-code-pro ];

  # Sway
  programs.sway.enable = true;

  # Custom program configurations
  programs.fish.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  services.blueman.enable = true;
}

