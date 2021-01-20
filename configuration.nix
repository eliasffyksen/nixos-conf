
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
    ];

  # Boot options
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Machine options
  networking.hostName = "nixpad";
  time.timeZone = "Europe/London";

  # Package dependency managment
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Networking
  networking.useDHCP = false;
  # networking.interfaces.enp0s31f6.useDHCP = true;
  # networking.interfaces.ens12u1u4.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.networkmanager.enable = true;

  # Wifi
  # networking.wireless.enable = true;
  # networking.wireless.networks = {
  #   Glide0198626-5G = {
  #     psk = "";
  #   };
  # };

  # Firewall configuration
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];


  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # User configuration
  home-manager = {
    useGlobalPkgs = true;
    users.elias = (import ./home/elias);
  };
  users.users.elias = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ];
    createHome = true;
    home = "/home/elias";
    shell = pkgs.fish;
  };

  # System state version
  # (!!!NB: READ NixOS MANUAL BEFORE MESSING WITH THIS!!!)
  system.stateVersion = "20.09";
}

