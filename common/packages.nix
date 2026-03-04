{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Development packages
    gnumake gcc gdb bison flex # GCC Build Tools
    ghc cabal-install # Haksell
    nodejs_24 yarn # JavaScript
    docker-compose # Docker
    rustup
    go go-migrate
	claude-code
	dbeaver-bin

	/*
	cudaPackages_12.cudatoolkit
    (python313.withPackages (p: with p; [
	  torch
	  transformers
	  numpy
	  scipy
	  matplotlib
	  psycopg
	]))
	*/

    # User applications
    mako libnotify # Notification center
    grim slurp # Sway screenshot
	arandr # Screen layout
    ranger firefox spotify playerctl pavucontrol steam
    i3status chromium xclip libreoffice jetbrains.idea-community
    wireshark zathura zoom-us brightnessctl ffmpeg discord transmission-qt
    filezilla wally-cli prismlauncher graphviz feh dmenu vlc libsForQt5.kalarm
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

