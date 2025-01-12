{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Development packages
    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs-18_x yarn # JavaScript
    docker-compose # Docker
    blender # Game Dev
    rustup
    go go-migrate

	cudaPackages_11.cudatoolkit
    (python312.withPackages (p: with p; [
	  pytorch
	]))
	#swig pyright

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
	arandr # Screen layout
    ranger firefox spotify playerctl pavucontrol steam
    i3status gimp chromium xclip libreoffice jetbrains.idea-community
    wireshark zathura zoom-us brightnessctl ffmpeg discord transmission-qt
    freecad filezilla wally-cli prismlauncher graphviz feh dmenu vlc libsForQt5.kalarm
	gparted
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Fonts
  fonts.packages = with pkgs;
  [ font-awesome source-code-pro ];

  # Custom program configurations
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  services.blueman.enable = true;

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  # Needed for vscode
  nixpkgs.config.allowUnfree = true;
}

