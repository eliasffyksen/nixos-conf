{ pkgs, ... }:
let
  python3WithPackages = pkgs.python3.withPackages(p: with p; [
    (opencv4.override(old: { enableGtk2 = true; }))
    compiledb
    jedi
    jupyterlab
    matplotlib
    numpy
    pandas
    pylint
    scipy
  ]);
in
{
  # Common packages
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect traceroute

    # Development packages
    clang_11 lld_11 lldb_11 llvm_11 llvmPackages.bintools # Clang LLVM
    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs # NodeJS
    docker-compose # Docker
    python3Full # Python
    blender unity3d # Game Dev
    rstudio jupyter # R
    rustc

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
    ranger termite firefox spotify discord pavucontrol steam
    i3status gimp chromium xclip teams libreoffice jetbrains.idea-community
  ];

  # JAVA
  programs.java = {
    enable = true;
    package = pkgs.openjdk11;
  };

  # Fonts
  fonts.fonts = with pkgs;
  [ font-awesome source-code-pro ];
  
  # Custom program configurations
  programs.sway.enable = true;
  programs.fish.enable = true;
  virtualisation.docker.enable = true;
}

