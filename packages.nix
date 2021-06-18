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
    simplejson
  ]);
in
{
  # Common packages
  
  nixpkgs.overlays = [(self: super: {
    discord = super.discord.overrideAttrs (
      oldAttrs: rec {
        version = "0.0.15";
        src = super.fetchurl {
          url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
          sha256 = "re3pVOnGltluJUdZtTlSeiSrHULw1UjFxDCdGj/Dwl4=";
        };
      }
    );
  })];

  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect traceroute inetutils sshpass
    pmutils

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
    ranger termite firefox spotify playerctl discord pavucontrol steam
    i3status gimp chromium xclip teams libreoffice jetbrains.idea-community
    wireshark zathura zoom-us

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

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  # Xorg i3
  console.useXkbConfig = true;

  services.xserver = {
    enable = true;

    layout = "us";
    xkbOptions = "caps:escape";

    libinput = {
      enable = true;
      middleEmulation = false;
      accelProfile = "flat";
      accelSpeed = "0";
    };

    displayManager.startx.enable = true;
    displayManager.defaultSession = "none+i3";

    windowManager.i3.enable = true;
  };
}

