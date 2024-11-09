{ pkgs, ... }:
{
  # Common packages

  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect traceroute inetutils sshpass
    pmutils sysbench lm_sensors file neovim bc p7zip moreutils
    rclone tmux pstree networkmanager at usbutils

    # Development packages
    clang_11 lld_11 lldb_11
    # (llvm_11.overrideAttrs (oldAttrs: {
    #   debugVersion = true;
    #   cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DLLVM_ENABLE_ASSERTIONS=ON" ];
    #   pname = "llvm-debug-assert";
    # })) llvmPackages.bintools # Clang LLVM

    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs-18_x yarn # JavaScript
    docker-compose # Docker
    blender # Game Dev
    rustup
    go go-migrate

    (python312.withPackages (p: with p; []))
	swig pyright

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
	arandr # Screen layout
    ranger firefox spotify playerctl pavucontrol steam
    i3status gimp chromium xclip libreoffice jetbrains.idea-community
    wireshark zathura zoom-us brightnessctl ffmpeg discord transmission-qt
    freecad filezilla wally-cli prismlauncher graphviz feh dmenu vlc libsForQt5.kalarm
	ripgrep fzf
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.neovim.enable = true;

  # Fonts
  fonts.packages = with pkgs;
  [ font-awesome source-code-pro ];

  # Custom program configurations
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  services.blueman.enable = true;

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
}

