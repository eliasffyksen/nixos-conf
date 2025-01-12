{ pkgs, config, ... }:
let
	secrets = import ./secrets.nix;
in
{
  # Common packages
  environment.systemPackages = with pkgs; [
    # System utils
    wget curl gnupg git git-crypt ncdu gotop htop tree killall
    gptfdisk zip unzip openconnect traceroute inetutils sshpass
    pmutils sysbench lm_sensors file neovim bc p7zip moreutils
    rclone tmux pstree networkmanager at usbutils ripgrep fzf
	rsync pciutils neovim
  ];


  time.timeZone = "Europe/London";

  # Networking
  boot.extraModulePackages = with config.boot.kernelPackages; [ rtl88x2bu ];
  boot.kernelModules = [ "88x2bu" ];
  networking.useDHCP = true;

  # Wifi
  networking.wireless.enable = true;
  networking.wireless.networks = secrets.networks;

  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ ];

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}

